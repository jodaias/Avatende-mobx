// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStoreBase, Store {
  Computed<dynamic> _$userListComputed;

  @override
  dynamic get userList =>
      (_$userListComputed ??= Computed<dynamic>(() => super.userList,
              name: '_UserStoreBase.userList'))
          .value;

  final _$loadingAtom = Atom(name: '_UserStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$orderByAzAtom = Atom(name: '_UserStoreBase.orderByAz');

  @override
  bool get orderByAz {
    _$orderByAzAtom.reportRead();
    return super.orderByAz;
  }

  @override
  set orderByAz(bool value) {
    _$orderByAzAtom.reportWrite(value, super.orderByAz, () {
      super.orderByAz = value;
    });
  }

  final _$listActiveAtom = Atom(name: '_UserStoreBase.listActive');

  @override
  bool get listActive {
    _$listActiveAtom.reportRead();
    return super.listActive;
  }

  @override
  set listActive(bool value) {
    _$listActiveAtom.reportWrite(value, super.listActive, () {
      super.listActive = value;
    });
  }

  final _$departmentIdAtom = Atom(name: '_UserStoreBase.departmentId');

  @override
  String get departmentId {
    _$departmentIdAtom.reportRead();
    return super.departmentId;
  }

  @override
  set departmentId(String value) {
    _$departmentIdAtom.reportWrite(value, super.departmentId, () {
      super.departmentId = value;
    });
  }

  final _$companyIdAtom = Atom(name: '_UserStoreBase.companyId');

  @override
  String get companyId {
    _$companyIdAtom.reportRead();
    return super.companyId;
  }

  @override
  set companyId(String value) {
    _$companyIdAtom.reportWrite(value, super.companyId, () {
      super.companyId = value;
    });
  }

  final _$userTypeAtom = Atom(name: '_UserStoreBase.userType');

  @override
  UserType get userType {
    _$userTypeAtom.reportRead();
    return super.userType;
  }

  @override
  set userType(UserType value) {
    _$userTypeAtom.reportWrite(value, super.userType, () {
      super.userType = value;
    });
  }

  final _$updateUserAsyncAction = AsyncAction('_UserStoreBase.updateUser');

  @override
  Future<bool> updateUser(String userId, Map<String, dynamic> userData) {
    return _$updateUserAsyncAction
        .run(() => super.updateUser(userId, userData));
  }

  final _$_UserStoreBaseActionController =
      ActionController(name: '_UserStoreBase');

  @override
  void setDepartmentId(String value) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setDepartmentId');
    try {
      return super.setDepartmentId(value);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCompanyId(String value) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setCompanyId');
    try {
      return super.setCompanyId(value);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserType(UserType value) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setUserType');
    try {
      return super.setUserType(value);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOrderByAz(bool value) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setOrderByAz');
    try {
      return super.setOrderByAz(value);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListActive(bool value) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setListActive');
    try {
      return super.setListActive(value);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void activeOrOrderList(ActivesOrOrderByUser result) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.activeOrOrderList');
    try {
      return super.activeOrOrderList(result);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
orderByAz: ${orderByAz},
listActive: ${listActive},
departmentId: ${departmentId},
companyId: ${companyId},
userType: ${userType},
userList: ${userList}
    ''';
  }
}
