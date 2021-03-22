import 'package:avatende/models/views/company_view_model.dart';
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
  String companyId;

  @action
  void setProducao(bool value) => producao = value;

  @action
  void setUser(UserViewModel value) => userViewModel = value;

  @action
  void setCompanyId(String value) => companyId = value;

  @action
  Future<void> getUser() async {
    var user = await repositoryUser.getUser(
        userId: userViewModel.userId(), userType: userViewModel.userType);

    setUser(user);
  }

  @action
  Future<void> getCompanyId() async {
    var id = await companyRepository.getCompanyId(
        userType: userViewModel.userType,
        departmentId: userViewModel.departmentId);

    setCompanyId(id);
  }
}
