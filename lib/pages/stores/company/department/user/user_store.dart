import 'package:avatende/models/views/user_view_model.dart';
import 'package:avatende/repositories/company/department/user/user_repository.dart';
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
  final repository = UserRepository();

  //OBSERVABLES
  @observable
  bool loading = false;

  @observable
  bool orderByAz = true;

  @observable
  bool listActive = true;
  @observable
  List<UserViewModel> userList = [];

  @observable
  List<UserViewModel> userListInactive = [];

  //ACTIONS
  @action
  void setOrderByAz(bool value) => orderByAz = value;

  @action
  void setListActive(bool value) => listActive = value;

  @action
  setUserList(List<UserViewModel> value) => userList = value;

  @action
  setUserListInactive(List<UserViewModel> value) => userListInactive = value;

  @action
  List<UserViewModel> listUsers() {
    loading = true;

    repository.usersList().then((value) {
      cleanLists();
      value.forEach((element) {
        if (element.active) {
          print('passou aqui');
          userList.add(element);
        } else {
          userListInactive.add(element);
        }
      });
      userListInactive.forEach((element) {
        print(listActive);
      });
    }).catchError((error) {
      loading = false;
      print("Error01: $error");
    });

    if (listActive) {
      return userList;
    } else {
      return userListInactive;
    }
  }

  void cleanLists() {
    setUserList(new List<UserViewModel>());
    setUserListInactive(new List<UserViewModel>());
  }

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

  //COMPUTEDS
}
