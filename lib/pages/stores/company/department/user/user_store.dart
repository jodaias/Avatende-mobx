import 'package:avatende/repositories/company/department/user/user_repository.dart';
import 'package:mobx/mobx.dart';
part 'user_store.g.dart';

enum ActivesOrOrderByUser {
  actives,
  inactives,
}

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  //REPOSITÓRIO
  final repository = UserRepository();

  //OBSERVABLES
  @observable
  bool loading = false;

  @observable
  bool orderByAz = true;

  @observable
  bool listActive = true;

  @observable
  String departmentId;

  @observable
  String companyId;

  //ACTIONS
  @action
  void setDepartmentId(String value) => departmentId = value;

  @action
  void setCompanyId(String value) => companyId = value;

  @action
  void setOrderByAz(bool value) => orderByAz = value;

  @action
  void setListActive(bool value) => listActive = value;

  @action
  void activeOrOrderList(ActivesOrOrderByUser result) {
    switch (result) {
      case ActivesOrOrderByUser.actives:
        setListActive(true);
        break;
      case ActivesOrOrderByUser.inactives:
        setListActive(false);
        break;
    }
  }

  //COMPUTEDS
  @computed
  get userList => repository
      .usersActives(departmentId != null ? departmentId : companyId)
      .value;

  @computed
  get userListInactive => repository
      .usersInactives(departmentId != null ? departmentId : companyId)
      .value;
}
