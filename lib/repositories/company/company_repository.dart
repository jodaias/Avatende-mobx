import 'package:avatende/models/company_model.dart';
import 'package:avatende/models/views/company_view_model.dart';
import 'package:avatende/pages/stores/company/company_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class CompanyRepository {
  CollectionReference _collection =
      FirebaseFirestore.instance.collection('Companys');

  //add uma empresa
  Future<String> createCompany(CompanyModel companymodel) async {
    try {
      //logica para salvar no banco
      await _collection.add({
        'Name': companymodel.name,
        'Address': companymodel.address,
        'Phone': companymodel.phone,
        'Active': companymodel.active,
        'CreatedAt': DateTime.now()
      });

      return 'Cadastro realizado com sucesso!';
    } catch (e) {
      print('Error02: $e');
      return 'Erro: Falha ao tentar cadastrar Empresa. Tente novamente!';
    }
  }

  //lista de empresas Ativas
  Observable<Stream<List<CompanyViewModel>>> get companiesActives {
    return Observable(_collection
        .where("Active", isEqualTo: true)
        .snapshots()
        .map((query) => query.docs
            .map<CompanyViewModel>(
                (document) => CompanyViewModel.fromMap(document))
            .toList()));
  }

  //lista de empresas Inativas
  Observable<Stream<List<CompanyViewModel>>> get companiesInactives {
    return Observable(_collection
        .where("Active", isEqualTo: false)
        .snapshots()
        .map((query) => query.docs
            .map<CompanyViewModel>(
                (document) => CompanyViewModel.fromMap(document))
            .toList()));
  }
}
