// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DepartmentStore on _DepartmentStoreBase, Store {
  Computed<dynamic> _$departmentListComputed;

  @override
  dynamic get departmentList => (_$departmentListComputed ??= Computed<dynamic>(
          () => super.departmentList,
          name: '_DepartmentStoreBase.departmentList'))
      .value;

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

  final _$companyIdAtom = Atom(name: '_DepartmentStoreBase.companyId');

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

  final _$nameAtom = Atom(name: '_DepartmentStoreBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$updateDepartmentsAsyncAction =
      AsyncAction('_DepartmentStoreBase.updateDepartments');

  @override
  Future<bool> updateDepartments(
      String departmentId, Map<String, dynamic> departmentData) {
    return _$updateDepartmentsAsyncAction
        .run(() => super.updateDepartments(departmentId, departmentData));
  }

  final _$_DepartmentStoreBaseActionController =
      ActionController(name: '_DepartmentStoreBase');

  @override
  void setName(String value) {
    final _$actionInfo = _$_DepartmentStoreBaseActionController.startAction(
        name: '_DepartmentStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_DepartmentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCompanyId(String value) {
    final _$actionInfo = _$_DepartmentStoreBaseActionController.startAction(
        name: '_DepartmentStoreBase.setCompanyId');
    try {
      return super.setCompanyId(value);
    } finally {
      _$_DepartmentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
  String toString() {
    return '''
loading: ${loading},
orderByAz: ${orderByAz},
listActive: ${listActive},
companyId: ${companyId},
name: ${name},
departmentList: ${departmentList}
    ''';
  }
}
