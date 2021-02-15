import 'package:avatende/models/company_model.dart';
import 'package:avatende/models/department_model.dart';
import 'package:avatende/models/user_model.dart';
import 'package:avatende/models/views/company_view_model.dart';
import 'package:avatende/models/views/department_view_model.dart';
import 'package:avatende/models/views/relatory_view_model.dart';
import 'package:avatende/models/views/user_view_model.dart';

abstract class IRepository {
  Future<CompanyViewModel> signUpCompany(CompanyModel companymodel);
  Future<DepartmentViewModel> signUpDepartment(DepartmentModel companymodel);
  Future<UserViewModel> signUpUser({UserModel usermodel, String password});
  Future<UserViewModel> signIn({UserModel usermodel, String password});
  Future<List<CompanyViewModel>> companysList();
  Future<List<DepartmentViewModel>> departmentsList();
  Future<List<UserViewModel>> usersList();
  Future<List<RelatoryViewModel>> relatorysList();
}
