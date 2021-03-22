import 'package:avatende/models/views/company_view_model.dart';
import 'package:avatende/models/views/department_view_model.dart';
import 'package:avatende/models/views/user_view_model.dart';
import 'package:avatende/repositories/company/company_repository.dart';
import 'package:avatende/repositories/company/department/user/user_repository.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;

abstract class _AppStoreBase with Store {
  var repositoryUser = new UserRepository();
  var companyRepository = new CompanyRepository();

  @observable
  bool producao;

  @observable
  UserViewModel userViewModel;

  @observable
  CompanyViewModel companyViewModel;

  @observable
  DepartmentViewModel departmentViewModel;

  @action
  void setProducao(bool value) => producao = value;

  @action
  void setUser(UserViewModel value) => userViewModel = value;

  @action
  void setCompany(CompanyViewModel value) => companyViewModel = value;

  @action
  void setDepartment(DepartmentViewModel value) => departmentViewModel = value;

  @action
  Future<void> getUser() async {
    var user = await repositoryUser.getUser(
        userId: userViewModel.userId(), userType: userViewModel.userType);

    setUser(user);
  }

  @action
  Future<void> getCompanyAndDepartment() async {
    var map = await companyRepository.getCompanyAndDeparment(
        userViewModel: userViewModel);

    setCompany(map['Company']);
    setDepartment(map['Department']);
  }
}
