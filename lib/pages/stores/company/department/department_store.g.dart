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
  Computed<dynamic> _$departmentListInactiveComputed;

  @override
  dynamic get departmentListInactive => (_$departmentListInactiveComputed ??=
          Computed<dynamic>(() => super.departmentListInactive,
              name: '_DepartmentStoreBase.departmentListInactive'))
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

  final _$_DepartmentStoreBaseActionController =
      ActionController(name: '_DepartmentStoreBase');

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
listActive: ${listActive},
departmentList: ${departmentList},
departmentListInactive: ${departmentListInactive}
    ''';
  }
}
