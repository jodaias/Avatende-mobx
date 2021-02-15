import 'package:avatende/models/company_model.dart';
import 'package:avatende/models/department_model.dart';
import 'package:avatende/models/user_model.dart';
import 'package:avatende/models/views/company_view_model.dart';
import 'package:avatende/models/views/department_view_model.dart';
import 'package:avatende/models/views/relatory_view_model.dart';
import 'package:avatende/models/views/user_view_model.dart';
import 'package:avatende/repositories/interfaces/IRepository.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class Repository implements IRepository {
  Future<CompanyViewModel> signUpCompany(CompanyModel companymodel) async {
    //logica para salvar no banco
    // ParseObject company = new ParseObject("Company");
    // // Store an object
    // company.setAdd("name", companymodel.name);
    // company.setAdd("address", companymodel.address);
    // company.setAdd("active", companymodel.active);
    // company.setAdd("phone", companymodel.phone);

    //com graphQL

// mutation CreateObject{
// 	  createCompany(fields: {name: "UNASP", active:false, address:"Hortolandia", phone:"1935247837"
//     })
//       {
//         id,
// 	      name,
//         active,
//         address,
//         phone,
//         createdAt
// 	    }
// }
    try {
      // Saving object
      // // company.save().then((response) {
      //   return response.results;
      // });
    } catch (e) {
      print('Error02: $e');
      return CompanyViewModel();
    }
  }

  Future<DepartmentViewModel> signUpDepartment(
      DepartmentModel departmodel) async {
    //logica para salvar no banco
    try {
      //Tenta cadastrar o departamento
      return DepartmentViewModel();
    } catch (e) {
      print('Error: $e');
      return DepartmentViewModel();
    }
  }

  Future<UserViewModel> signUpUser(
      {UserModel usermodel, String password}) async {
    await Future.delayed(Duration(seconds: 2));

    //logica para salvar no banco
    try {
      //Tenta cadastrar o usuario

      return UserViewModel();
    } catch (e) {
      print('Error: $e');
      return UserViewModel();
    }
  }

  Future<UserViewModel> signIn({UserModel usermodel, String password}) async {
    await Future.delayed(Duration(seconds: 2));

    //Logica de enviar os dados no banco e retornar o usuario logado.

    try {
      return UserViewModel();
    } catch (e) {
      print('Error: $e');
      return UserViewModel();
    }
  }

  Future<List<CompanyViewModel>> companysList() async {
    await Future.delayed(Duration(seconds: 2));

    //logica de trazer as empresas e salvar na lista companys
    ParseObject company = new ParseObject("Company");

    company.getAll().then((response) {
      return response.results;
    });
    try {} catch (e) {
      print('Error: $e');
      return List<CompanyViewModel>();
    }
  }

  Future<List<DepartmentViewModel>> departmentsList() async {
    await Future.delayed(Duration(seconds: 2));
    List<DepartmentViewModel> departments = [];

    //logica de trazer os departamentos e salvar na lista departments
    try {} catch (e) {
      print('Error: $e');
    }
    return departments;
  }

  Future<List<UserViewModel>> usersList() async {
    await Future.delayed(Duration(seconds: 2));
    List<UserViewModel> users = [];

    //logica de trazer os usuarios e salvar na lista users
    try {} catch (e) {
      print('Error: $e');
    }
    return users;
  }

  Future<List<RelatoryViewModel>> relatorysList() async {
    await Future.delayed(Duration(seconds: 2));
    List<RelatoryViewModel> relatorys = [];

    //logica de trazer os relatorios e salvar na lista relatorys
    try {} catch (e) {
      print('Error: $e');
    }
    return relatorys;
  }
}
