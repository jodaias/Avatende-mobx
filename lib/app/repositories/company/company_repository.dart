import 'package:avatende/app/enums/user-type.dart';
import 'package:avatende/app/models/company_model.dart';
import 'package:avatende/app/models/views/company_view_model.dart';
import 'package:avatende/app/models/views/department_view_model.dart';
import 'package:avatende/app/models/views/user_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

class CompanyRepository {
  final _instance = FirebaseFirestore.instance;
  var _collection = 'Companys';

  //add uma empresa
  Future<String> createCompany(CompanyModel companymodel) async {
    try {
      // FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
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

  Future<bool> updateCompany(
      {String companyId, Map<String, dynamic> companyData}) async {
    try {
      await _instance
          .collection(_collection)
          .doc(companyId)
          .update(companyData);

      return true;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  //lista de empresas Ativas
  Observable<Stream<List<CompanyViewModel>>> companies(
      bool listActive, bool orderByAz) {
    return Observable(_instance
        .collection(_collection)
        .where("Active", isEqualTo: listActive)
        .orderBy('Name', descending: !orderByAz)
        .snapshots()
        .map((query) => query.docs
            .map<CompanyViewModel>(
                (document) => CompanyViewModel.fromMap(document))
            .toList()));
  }

  Future<Map<String, dynamic>> getCompanyAndDepartment(
      {UserViewModel userViewModel}) async {
    var department;

    try {
      if (userViewModel.userType == UserType.User) {
        _collection = 'Departments';
        department = await _instance
            .collection(_collection)
            .doc(userViewModel.departmentId)
            .get();
      }

      _collection = 'Companys';

      var company = await _instance
          .collection(_collection)
          .doc(userViewModel.userType == UserType.User
              ? department.data()['CompanyId']
              : userViewModel.companyId)
          .get();

      if (userViewModel.userType == UserType.User) {
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
