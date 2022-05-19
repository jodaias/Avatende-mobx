import 'package:avatende/app/enums/user-type.dart';
import 'package:avatende/app/pages/stores/notification/notification_store.dart';
import 'package:avatende/app/repositories/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
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

  final notificationStore = GetIt.I<NotificationStore>();

  //OBSERVABLES
  @observable
  bool loading = false;

  @observable
  bool orderByAz = true;

  @observable
  bool listActive = true;

  @observable
  String? departmentId;

  @observable
  String? companyId;

  @observable
  UserType? userType;

  //ACTIONS
  @action
  void setDepartmentId(String? value) => departmentId = value;

  @action
  void setCompanyId(String? value) => companyId = value;

  @action
  void setUserType(UserType? value) => userType = value;

  @action
  void setOrderByAz(bool value) => orderByAz = value;

  @action
  void setListActive(bool value) => listActive = value;

  @action
  void setLoading(bool value) => loading = value;

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
  Future<void> updateUser(String userId, Map<String, dynamic> userData) async {
    await _repository
        .updateUser(userId: userId, userData: userData)
        .then((value) {
      notificationStore.showMessage(
          backgroundColor: Colors.green,
          textColor: Colors.white,
          gravity: ToastGravity.SNACKBAR);
    }).catchError((onError) {
      notificationStore.showMessage(
          backgroundColor: Colors.red,
          textColor: Colors.white,
          gravity: ToastGravity.SNACKBAR);
    });
  }

  //COMPUTEDS
  @computed
  get userList => _repository
      .users(departmentId != null ? departmentId! : companyId!, userType!,
          listActive, orderByAz)
      .value;
}
