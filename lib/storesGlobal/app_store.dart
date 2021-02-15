import 'package:avatende/models/views/company_view_model.dart';
import 'package:avatende/models/views/department_view_model.dart';
import 'package:avatende/models/views/relatory_view_model.dart';
import 'package:avatende/models/views/user_view_model.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;

abstract class _AppStoreBase with Store {
  @observable
  UserViewModel userViewModel;

  @observable
  DepartmentViewModel departmentViewModel;

  @observable
  RelatoryViewModel relatoryViewModel;

  @observable
  CompanyViewModel companyViewModel;

  @action
  void setUser(UserViewModel value) => userViewModel = value;

  @action
  void setCompany(CompanyViewModel value) => companyViewModel = value;

  @action
  void setDepartment(DepartmentViewModel value) => departmentViewModel = value;

  @action
  void setRelatory(RelatoryViewModel value) => relatoryViewModel = value;
}
