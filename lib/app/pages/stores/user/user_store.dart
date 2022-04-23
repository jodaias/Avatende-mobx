import 'package:avatende/app/enums/user-type.dart';
import 'package:avatende/app/repositories/user/user_repository.dart';
import 'package:mobx/mobx.dart';
part 'user_store.g.dart';

enum ActivesOrOrderByUser {
  actives,
  inactives,
  orderByAZ,
  orderByZA,
}

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  //REPOSITÓRIO
  final _repository = UserRepository();

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

  @observable
  UserType userType;

  //ACTIONS
  @action
  void setDepartmentId(String value) => departmentId = value;

  @action
  void setCompanyId(String value) => companyId = value;

  @action
  void setUserType(UserType value) => userType = value;

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
      case ActivesOrOrderByUser.orderByAZ:
        setOrderByAz(true);
        break;
      case ActivesOrOrderByUser.orderByZA:
        setOrderByAz(false);
        break;
    }
  }

  @action
  Future<bool> updateUser(String userId, Map<String, dynamic> userData) async {
    return await _repository.updateUser(userId: userId, userData: userData);
  }

  //COMPUTEDS
  @computed
  get userList => _repository
      .users(departmentId != null ? departmentId : companyId, userType,
          listActive, orderByAz)
      .value;
}
