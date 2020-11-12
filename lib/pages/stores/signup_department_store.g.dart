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
  Computed<bool> _$addressValidComputed;

  @override
  bool get addressValid =>
      (_$addressValidComputed ??= Computed<bool>(() => super.addressValid,
              name: '_SignupDepartmentStoreBase.addressValid'))
          .value;
  Computed<Function> _$signUpPressedComputed;

  @override
  Function get signUpPressed =>
      (_$signUpPressedComputed ??= Computed<Function>(() => super.signUpPressed,
              name: '_SignupDepartmentStoreBase.signUpPressed'))
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

  final _$addressAtom = Atom(name: '_SignupDepartmentStoreBase.address');

  @override
  String get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(String value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  final _$activeAtom = Atom(name: '_SignupDepartmentStoreBase.active');

  @override
  bool get active {
    _$activeAtom.reportRead();
    return super.active;
  }

  @override
  set active(bool value) {
    _$activeAtom.reportWrite(value, super.active, () {
      super.active = value;
    });
  }

  final _$loadingAtom = Atom(name: '_SignupDepartmentStoreBase.loading');

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

  final _$signupSuccessAtom =
      Atom(name: '_SignupDepartmentStoreBase.signupSuccess');

  @override
  bool get signupSuccess {
    _$signupSuccessAtom.reportRead();
    return super.signupSuccess;
  }

  @override
  set signupSuccess(bool value) {
    _$signupSuccessAtom.reportWrite(value, super.signupSuccess, () {
      super.signupSuccess = value;
    });
  }

  final _$signUpAsyncAction = AsyncAction('_SignupDepartmentStoreBase.signUp');

  @override
  Future<void> signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
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
  void setAddress(String value) {
    final _$actionInfo = _$_SignupDepartmentStoreBaseActionController
        .startAction(name: '_SignupDepartmentStoreBase.setAddress');
    try {
      return super.setAddress(value);
    } finally {
      _$_SignupDepartmentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
phone: ${phone},
address: ${address},
active: ${active},
loading: ${loading},
signupSuccess: ${signupSuccess},
nameValid: ${nameValid},
phoneValid: ${phoneValid},
addressValid: ${addressValid},
signUpPressed: ${signUpPressed}
    ''';
  }
}
