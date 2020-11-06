import 'package:avatende/models/company_model.dart';
import 'package:avatende/models/department_model.dart';
import 'package:avatende/models/relatory_model.dart';
import 'package:mobx/mobx.dart';
import 'package:avatende/models/user_model.dart';
part 'app_store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;

abstract class _AppStoreBase with Store {
  @observable
  UserModel userModel;

  @observable
  DepartmentModel departmentModel;

  @observable
  RelatoryModel relatoryModel;

  @observable
  CompanyModel companyModel;

  @action
  void setUser(UserModel value) => userModel = value;

  @action
  void setCompany(CompanyModel value) => companyModel = value;

  @action
  void setDepartment(DepartmentModel value) => departmentModel = value;

  @action
  void setRelatory(RelatoryModel value) => relatoryModel = value;
}
