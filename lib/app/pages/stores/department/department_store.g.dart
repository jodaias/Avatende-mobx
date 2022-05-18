// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DepartmentStore on _DepartmentStoreBase, Store {
  Computed<dynamic>? _$departmentListComputed;

  @override
  dynamic get departmentList => (_$departmentListComputed ??= Computed<dynamic>(
          () => super.departmentList,
          name: '_DepartmentStoreBase.departmentList'))
      .value;

  late final _$loadingAtom =
      Atom(name: '_DepartmentStoreBase.loading', context: context);

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

  late final _$orderByAzAtom =
      Atom(name: '_DepartmentStoreBase.orderByAz', context: context);

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

  late final _$listActiveAtom =
      Atom(name: '_DepartmentStoreBase.listActive', context: context);

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

  late final _$companyIdAtom =
      Atom(name: '_DepartmentStoreBase.companyId', context: context);

  @override
  String? get companyId {
    _$companyIdAtom.reportRead();
    return super.companyId;
  }

  @override
  set companyId(String? value) {
    _$companyIdAtom.reportWrite(value, super.companyId, () {
      super.companyId = value;
    });
  }

  late final _$nameAtom =
      Atom(name: '_DepartmentStoreBase.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$updateDepartmentsAsyncAction =
      AsyncAction('_DepartmentStoreBase.updateDepartments', context: context);

  @override
  Future<bool> updateDepartments(
      String departmentId, Map<String, dynamic> departmentData) {
    return _$updateDepartmentsAsyncAction
        .run(() => super.updateDepartments(departmentId, departmentData));
  }

  late final _$_DepartmentStoreBaseActionController =
      ActionController(name: '_DepartmentStoreBase', context: context);

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
