import 'package:avatende/models/company_model.dart';
import 'package:avatende/models/department_model.dart';
import 'package:avatende/models/relatory_model.dart';
import 'package:avatende/models/user_model.dart';

class Repository {
  Future<CompanyModel> signUpCompany(CompanyModel companymodel) async {
    await Future.delayed(Duration(seconds: 2));
    //logica para salvar no banco

    try {
      //Tenta cadastrar a empresa
      return companymodel;
    } catch (e) {
      print('Error02: $e');
      return CompanyModel();
    }
  }

  Future<DepartmentModel> signUpDepartment(DepartmentModel departmodel) async {
    await Future.delayed(Duration(seconds: 2));

    //logica para salvar no banco
    try {
      //Tenta cadastrar o departamento
      return DepartmentModel(
        name: departmodel.name,
        active: departmodel.active,
        address: departmodel.address,
        companyId: departmodel.companyId,
        phone: departmodel.phone,
      );
    } catch (e) {
      print('Error: $e');
      return DepartmentModel();
    }
  }

  Future<UserModel> signUpUser({UserModel usermodel, String password}) async {
    await Future.delayed(Duration(seconds: 2));

    //logica para salvar no banco
    try {
      //Tenta cadastrar o usuario

      return UserModel(
        name: usermodel.name,
        email: usermodel.email,
        userType: usermodel.userType,
        active: usermodel.active,
        departmentId: usermodel.departmentId,
        phone: usermodel.phone,
      );
    } catch (e) {
      print('Error: $e');
      return UserModel();
    }
  }

  Future<UserModel> signIn({UserModel usermodel, String password}) async {
    await Future.delayed(Duration(seconds: 2));

    //Logica de enviar os dados no banco e retornar o usuario logado.
    try {
      //Tenta cadastrar o departamento
      return UserModel(
        name: 'Jodaias',
        email: usermodel.email,
        userType: '1',
        active: true,
        departmentId: 2,
        phone: '75991169903',
      );
    } catch (e) {
      print('Error: $e');
      return UserModel();
    }
  }

  Future<List<CompanyModel>> companysList() async {
    await Future.delayed(Duration(seconds: 2));
    List<CompanyModel> companys = [];

    //logica de trazer as empresas e salvar na lista companys
    try {} catch (e) {
      print('Error: $e');
    }
    return companys;
  }

  Future<List<DepartmentModel>> departmentsList() async {
    await Future.delayed(Duration(seconds: 2));
    List<DepartmentModel> departments = [];

    //logica de trazer os departamentos e salvar na lista departments
    try {} catch (e) {
      print('Error: $e');
    }
    return departments;
  }

  Future<List<UserModel>> usersList() async {
    await Future.delayed(Duration(seconds: 2));
    List<UserModel> users = [];

    //logica de trazer os usuarios e salvar na lista users
    try {} catch (e) {
      print('Error: $e');
    }
    return users;
  }

  Future<List<RelatoryModel>> relatorysList() async {
    await Future.delayed(Duration(seconds: 2));
    List<RelatoryModel> relatorys = [];

    //logica de trazer os relatorios e salvar na lista relatorys
    try {} catch (e) {
      print('Error: $e');
    }
    return relatorys;
  }
}
