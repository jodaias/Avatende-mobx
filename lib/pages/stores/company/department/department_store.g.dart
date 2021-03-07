// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DepartmentStore on _DepartmentStoreBase, Store {
  final _$loadingAtom = Atom(name: '_DepartmentStoreBase.loading');

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

  final _$orderByAzAtom = Atom(name: '_DepartmentStoreBase.orderByAz');

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

  final _$listActiveAtom = Atom(name: '_DepartmentStoreBase.listActive');

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

  final _$departmentListAtom =
      Atom(name: '_DepartmentStoreBase.departmentList');

  @override
  List<DepartmentViewModel> get departmentList {
    _$departmentListAtom.reportRead();
    return super.departmentList;
  }

  @override
  set departmentList(List<DepartmentViewModel> value) {
    _$departmentListAtom.reportWrite(value, super.departmentList, () {
      super.departmentList = value;
    });
  }

  final _$departmentListInactiveAtom =
      Atom(name: '_DepartmentStoreBase.departmentListInactive');

  @override
  List<DepartmentViewModel> get departmentListInactive {
    _$departmentListInactiveAtom.reportRead();
    return super.departmentListInactive;
  }

  @override
  set departmentListInactive(List<DepartmentViewModel> value) {
    _$departmentListInactiveAtom
        .reportWrite(value, super.departmentListInactive, () {
      super.departmentListInactive = value;
    });
  }

  final _$_DepartmentStoreBaseActionController =
      ActionController(name: '_DepartmentStoreBase');

  @override
  void setOrderByAz(bool value) {
    final _$actionInfo = _$_DepartmentStoreBaseActionController.startAction(
        name: '_DepartmentStoreBase.setOrderByAz');
    try {
      return super.setOrderByAz(value);
    } finally {
      _$_DepartmentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListActive(bool value) {
    final _$actionInfo = _$_DepartmentStoreBaseActionController.startAction(
        name: '_DepartmentStoreBase.setListActive');
    try {
      return super.setListActive(value);
    } finally {
      _$_DepartmentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDepartmentList(List<DepartmentViewModel> value) {
    final _$actionInfo = _$_DepartmentStoreBaseActionController.startAction(
        name: '_DepartmentStoreBase.setDepartmentList');
    try {
      return super.setDepartmentList(value);
    } finally {
      _$_DepartmentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDepartmentListInactive(List<DepartmentViewModel> value) {
    final _$actionInfo = _$_DepartmentStoreBaseActionController.startAction(
        name: '_DepartmentStoreBase.setDepartmentListInactive');
    try {
      return super.setDepartmentListInactive(value);
    } finally {
      _$_DepartmentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<DepartmentViewModel> listDepartments() {
    final _$actionInfo = _$_DepartmentStoreBaseActionController.startAction(
        name: '_DepartmentStoreBase.listDepartments');
    try {
      return super.listDepartments();
    } finally {
      _$_DepartmentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
orderByAz: ${orderByAz},
listActive: ${listActive},
departmentList: ${departmentList},
departmentListInactive: ${departmentListInactive}
    ''';
  }
}
