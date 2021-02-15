// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on _AppStoreBase, Store {
  final _$userViewModelAtom = Atom(name: '_AppStoreBase.userViewModel');

  @override
  UserViewModel get userViewModel {
    _$userViewModelAtom.reportRead();
    return super.userViewModel;
  }

  @override
  set userViewModel(UserViewModel value) {
    _$userViewModelAtom.reportWrite(value, super.userViewModel, () {
      super.userViewModel = value;
    });
  }

  final _$departmentViewModelAtom =
      Atom(name: '_AppStoreBase.departmentViewModel');

  @override
  DepartmentViewModel get departmentViewModel {
    _$departmentViewModelAtom.reportRead();
    return super.departmentViewModel;
  }

  @override
  set departmentViewModel(DepartmentViewModel value) {
    _$departmentViewModelAtom.reportWrite(value, super.departmentViewModel, () {
      super.departmentViewModel = value;
    });
  }

  final _$relatoryViewModelAtom = Atom(name: '_AppStoreBase.relatoryViewModel');

  @override
  RelatoryViewModel get relatoryViewModel {
    _$relatoryViewModelAtom.reportRead();
    return super.relatoryViewModel;
  }

  @override
  set relatoryViewModel(RelatoryViewModel value) {
    _$relatoryViewModelAtom.reportWrite(value, super.relatoryViewModel, () {
      super.relatoryViewModel = value;
    });
  }

  final _$companyViewModelAtom = Atom(name: '_AppStoreBase.companyViewModel');

  @override
  CompanyViewModel get companyViewModel {
    _$companyViewModelAtom.reportRead();
    return super.companyViewModel;
  }

  @override
  set companyViewModel(CompanyViewModel value) {
    _$companyViewModelAtom.reportWrite(value, super.companyViewModel, () {
      super.companyViewModel = value;
    });
  }

  final _$_AppStoreBaseActionController =
      ActionController(name: '_AppStoreBase');

  @override
  void setUser(UserViewModel value) {
    final _$actionInfo = _$_AppStoreBaseActionController.startAction(
        name: '_AppStoreBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCompany(CompanyViewModel value) {
    final _$actionInfo = _$_AppStoreBaseActionController.startAction(
        name: '_AppStoreBase.setCompany');
    try {
      return super.setCompany(value);
    } finally {
      _$_AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDepartment(DepartmentViewModel value) {
    final _$actionInfo = _$_AppStoreBaseActionController.startAction(
        name: '_AppStoreBase.setDepartment');
    try {
      return super.setDepartment(value);
    } finally {
      _$_AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRelatory(RelatoryViewModel value) {
    final _$actionInfo = _$_AppStoreBaseActionController.startAction(
        name: '_AppStoreBase.setRelatory');
    try {
      return super.setRelatory(value);
    } finally {
      _$_AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userViewModel: ${userViewModel},
departmentViewModel: ${departmentViewModel},
relatoryViewModel: ${relatoryViewModel},
companyViewModel: ${companyViewModel}
    ''';
  }
}
