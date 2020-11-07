// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on _AppStoreBase, Store {
  final _$userModelAtom = Atom(name: '_AppStoreBase.userModel');

  @override
  UserModel get userModel {
    _$userModelAtom.reportRead();
    return super.userModel;
  }

  @override
  set userModel(UserModel value) {
    _$userModelAtom.reportWrite(value, super.userModel, () {
      super.userModel = value;
    });
  }

  final _$departmentModelAtom = Atom(name: '_AppStoreBase.departmentModel');

  @override
  DepartmentModel get departmentModel {
    _$departmentModelAtom.reportRead();
    return super.departmentModel;
  }

  @override
  set departmentModel(DepartmentModel value) {
    _$departmentModelAtom.reportWrite(value, super.departmentModel, () {
      super.departmentModel = value;
    });
  }

  final _$relatoryModelAtom = Atom(name: '_AppStoreBase.relatoryModel');

  @override
  RelatoryModel get relatoryModel {
    _$relatoryModelAtom.reportRead();
    return super.relatoryModel;
  }

  @override
  set relatoryModel(RelatoryModel value) {
    _$relatoryModelAtom.reportWrite(value, super.relatoryModel, () {
      super.relatoryModel = value;
    });
  }

  final _$companyModelAtom = Atom(name: '_AppStoreBase.companyModel');

  @override
  CompanyModel get companyModel {
    _$companyModelAtom.reportRead();
    return super.companyModel;
  }

  @override
  set companyModel(CompanyModel value) {
    _$companyModelAtom.reportWrite(value, super.companyModel, () {
      super.companyModel = value;
    });
  }

  final _$_AppStoreBaseActionController =
      ActionController(name: '_AppStoreBase');

  @override
  void setUser(UserModel value) {
    final _$actionInfo = _$_AppStoreBaseActionController.startAction(
        name: '_AppStoreBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCompany(CompanyModel value) {
    final _$actionInfo = _$_AppStoreBaseActionController.startAction(
        name: '_AppStoreBase.setCompany');
    try {
      return super.setCompany(value);
    } finally {
      _$_AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDepartment(DepartmentModel value) {
    final _$actionInfo = _$_AppStoreBaseActionController.startAction(
        name: '_AppStoreBase.setDepartment');
    try {
      return super.setDepartment(value);
    } finally {
      _$_AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRelatory(RelatoryModel value) {
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
userModel: ${userModel},
departmentModel: ${departmentModel},
relatoryModel: ${relatoryModel},
companyModel: ${companyModel}
    ''';
  }
}
