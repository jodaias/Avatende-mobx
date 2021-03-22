import 'package:avatende/models/company_model.dart';
import 'package:avatende/models/views/company_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

class CompanyRepository {
  var _auth = FirebaseAuth.instance;
  var _instance = FirebaseFirestore.instance;
  var _collection = 'Companys';

  //add uma empresa
  Future<String> createCompany(CompanyModel companymodel) async {
    try {
      FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
      //logica para salvar no banco
      await _instance.collection(_collection).add({
        'Name': companymodel.name,
        'Address': companymodel.address,
        'Phone': companymodel.phone,
        'Active': companymodel.active,
        'CreatedAt': DateTime.now(),
      });

      return 'Cadastro realizado com sucesso!';
    } catch (e) {
      print('Error02: $e');
      return 'Erro: Falha ao tentar cadastrar Empresa. Tente novamente!';
    }
  }

  //lista de empresas Ativas
  Observable<Stream<List<CompanyViewModel>>> get companiesActives {
    print('$_collection');

    return Observable(_instance
        .collection(_collection)
        .where("Active", isEqualTo: true)
        .snapshots()
        .map((query) => query.docs
            .map<CompanyViewModel>(
                (document) => CompanyViewModel.fromMap(document))
            .toList()));
  }

  //lista de empresas Inativas
  Observable<Stream<List<CompanyViewModel>>> get companiesInactives {
    return Observable(_instance
        .collection(_collection)
        .where("Active", isEqualTo: false)
        .snapshots()
        .map((query) => query.docs
            .map<CompanyViewModel>(
                (document) => CompanyViewModel.fromMap(document))
            .toList()));
  }

  Future<String> getCompanyId({String userType, String departmentId}) async {
    if (userType == 'Atendente-Dev') {
      _collection = 'DepartmentsDev';
    } else {
      _collection = 'Departments';
    }

    try {
      var department =
          await _instance.collection(_collection).doc(departmentId).get();

      print(
          'depc $departmentId colect $_collection ${department.data()['CompanyId']}');

      return department.data()['CompanyId'];
    } catch (e) {
      return 'Error: $e';
    }
  }
}
