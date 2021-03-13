import 'package:avatende/models/company_model.dart';
import 'package:avatende/models/views/company_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

class CompanyRepository {
  var _auth = FirebaseAuth.instance;
  var _instance = FirebaseFirestore.instance;
  var _collection;

  //add uma empresa
  Future<String> createCompany(CompanyModel companymodel) async {
    try {
      if (_auth.currentUser.email == 'empresa@empresa.com') {
        _collection = 'DepartmentsDev';
      } else {
        _collection = 'Departments';
      }
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
    if (_auth.currentUser.email == 'empresa@empresa.com') {
      _collection = 'CompanysDev';
    } else {
      _collection = 'Companys';
    }

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
    if (_auth.currentUser.email == 'empresa@empresa.com') {
      _collection = 'CompanysDev';
    } else {
      _collection = 'Companys';
    }

    return Observable(_instance
        .collection(_collection)
        .where("Active", isEqualTo: false)
        .snapshots()
        .map((query) => query.docs
            .map<CompanyViewModel>(
                (document) => CompanyViewModel.fromMap(document))
            .toList()));
  }
}
