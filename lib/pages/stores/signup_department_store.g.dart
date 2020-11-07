// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_department_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignupDepartmentStore on _SignupDepartmentStoreBase, Store {
  Computed<bool> _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: '_SignupDepartmentStoreBase.nameValid'))
          .value;
  Computed<bool> _$phoneValidComputed;

  @override
  bool get phoneValid =>
      (_$phoneValidComputed ??= Computed<bool>(() => super.phoneValid,
              name: '_SignupDepartmentStoreBase.phoneValid'))
          .value;
  Computed<bool> _$formValidComputed;

  @override
  bool get formValid =>
      (_$formValidComputed ??= Computed<bool>(() => super.formValid,
              name: '_SignupDepartmentStoreBase.formValid'))
          .value;

  final _$nameAtom = Atom(name: '_SignupDepartmentStoreBase.name');

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

  final _$phoneAtom = Atom(name: '_SignupDepartmentStoreBase.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$_SignupDepartmentStoreBaseActionController =
      ActionController(name: '_SignupDepartmentStoreBase');

  @override
  void setName(String value) {
    final _$actionInfo = _$_SignupDepartmentStoreBaseActionController
        .startAction(name: '_SignupDepartmentStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_SignupDepartmentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_SignupDepartmentStoreBaseActionController
        .startAction(name: '_SignupDepartmentStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_SignupDepartmentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
phone: ${phone},
nameValid: ${nameValid},
phoneValid: ${phoneValid},
formValid: ${formValid}
    ''';
  }
}
