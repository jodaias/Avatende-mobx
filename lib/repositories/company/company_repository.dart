import 'package:avatende/models/company_model.dart';
import 'package:avatende/models/views/company_view_model.dart';
import 'package:avatende/models/views/department_view_model.dart';
import 'package:avatende/models/views/user_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

class CompanyRepository {
  final _instance = FirebaseFirestore.instance;
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

  Future<Map<String, dynamic>> getCompanyAndDepartment(
      {UserViewModel userViewModel}) async {
    var department;

    if (userViewModel.userType == 'Atendente-Dev') {
      _collection = 'DepartmentsDev';
    } else if (userViewModel.userType == 'Atendente') {
      _collection = 'Departments';
    } else if (userViewModel.userType == 'Admin-Dev') {
      _collection = 'CompanysDev';
    } else {
      _collection = 'Companys';
    }

    try {
      if (userViewModel.userType == 'Atendente-Dev' ||
          userViewModel.userType == 'Atendente') {
        department = await _instance
            .collection(_collection)
            .doc(userViewModel.departmentId)
            .get();
      }

      if (userViewModel.userType == 'Atendente-Dev' ||
          userViewModel.userType == 'Admin-Dev') {
        _collection = 'CompanysDev';
      } else {
        _collection = 'Companys';
      }

      var company = await _instance
          .collection(_collection)
          .doc(userViewModel.userType == 'Atendente-Dev' ||
                  userViewModel.userType == 'Atendente'
              ? department.data()['CompanyId']
              : userViewModel.companyId)
          .get();

      print('colllll $_collection ${company.data()['Active']}');
      if (userViewModel.userType == 'Atendente-Dev' ||
          userViewModel.userType == 'Atendente') {
        return {
          'Company': CompanyViewModel.fromMap(company),
          'Department': DepartmentViewModel.fromMap(department)
        };
      } else {
        return {
          'Company': CompanyViewModel.fromMap(company),
        };
      }
    } catch (e) {
      return {};
    }
  }
}
