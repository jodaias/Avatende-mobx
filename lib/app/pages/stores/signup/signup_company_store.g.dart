// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_company_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupCompanyStore on _SignupCompanyStoreBase, Store {
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: '_SignupCompanyStoreBase.nameValid'))
          .value;
  Computed<bool>? _$phoneValidComputed;

  @override
  bool get phoneValid =>
      (_$phoneValidComputed ??= Computed<bool>(() => super.phoneValid,
              name: '_SignupCompanyStoreBase.phoneValid'))
          .value;
  Computed<bool>? _$addressValidComputed;

  @override
  bool get addressValid =>
      (_$addressValidComputed ??= Computed<bool>(() => super.addressValid,
              name: '_SignupCompanyStoreBase.addressValid'))
          .value;
  Computed<bool>? _$activeValidComputed;

  @override
  bool get activeValid =>
      (_$activeValidComputed ??= Computed<bool>(() => super.activeValid,
              name: '_SignupCompanyStoreBase.activeValid'))
          .value;
  Computed<VoidCallback?>? _$signUpPressedComputed;

  @override
  VoidCallback? get signUpPressed => (_$signUpPressedComputed ??=
          Computed<VoidCallback?>(() => super.signUpPressed,
              name: '_SignupCompanyStoreBase.signUpPressed'))
      .value;
  Computed<VoidCallback?>? _$updatePressedComputed;

  @override
  VoidCallback? get updatePressed => (_$updatePressedComputed ??=
          Computed<VoidCallback?>(() => super.updatePressed,
              name: '_SignupCompanyStoreBase.updatePressed'))
      .value;

  late final _$companyIdAtom =
      Atom(name: '_SignupCompanyStoreBase.companyId', context: context);

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
      Atom(name: '_SignupCompanyStoreBase.name', context: context);

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

  late final _$addressAtom =
      Atom(name: '_SignupCompanyStoreBase.address', context: context);

  @override
  String? get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(String? value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$phoneAtom =
      Atom(name: '_SignupCompanyStoreBase.phone', context: context);

  @override
  String? get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String? value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$activeAtom =
      Atom(name: '_SignupCompanyStoreBase.active', context: context);

  @override
  bool? get active {
    _$activeAtom.reportRead();
    return super.active;
  }

  @override
  set active(bool? value) {
    _$activeAtom.reportWrite(value, super.active, () {
      super.active = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_SignupCompanyStoreBase.loading', context: context);

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

  late final _$signupSuccessAtom =
      Atom(name: '_SignupCompanyStoreBase.signupSuccess', context: context);

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

  late final _$signUpAsyncAction =
      AsyncAction('_SignupCompanyStoreBase.signUp', context: context);

  @override
  Future<void> signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  late final _$updateCompanyAsyncAction =
      AsyncAction('_SignupCompanyStoreBase.updateCompany', context: context);

  @override
  Future<void> updateCompany() {
    return _$updateCompanyAsyncAction.run(() => super.updateCompany());
  }

  late final _$_SignupCompanyStoreBaseActionController =
      ActionController(name: '_SignupCompanyStoreBase', context: context);

  @override
  void setCompanyId(String? value) {
    final _$actionInfo = _$_SignupCompanyStoreBaseActionController.startAction(
        name: '_SignupCompanyStoreBase.setCompanyId');
    try {
      return super.setCompanyId(value);
    } finally {
      _$_SignupCompanyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String? value) {
    final _$actionInfo = _$_SignupCompanyStoreBaseActionController.startAction(
        name: '_SignupCompanyStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_SignupCompanyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String? value) {
    final _$actionInfo = _$_SignupCompanyStoreBaseActionController.startAction(
        name: '_SignupCompanyStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_SignupCompanyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setActive(bool? value) {
    final _$actionInfo = _$_SignupCompanyStoreBaseActionController.startAction(
        name: '_SignupCompanyStoreBase.setActive');
    try {
      return super.setActive(value);
    } finally {
      _$_SignupCompanyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSignupSuccess(bool value) {
    final _$actionInfo = _$_SignupCompanyStoreBaseActionController.startAction(
        name: '_SignupCompanyStoreBase.setSignupSuccess');
    try {
      return super.setSignupSuccess(value);
    } finally {
      _$_SignupCompanyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAddress(String? value) {
    final _$actionInfo = _$_SignupCompanyStoreBaseActionController.startAction(
        name: '_SignupCompanyStoreBase.setAddress');
    try {
      return super.setAddress(value);
    } finally {
      _$_SignupCompanyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
companyId: ${companyId},
name: ${name},
address: ${address},
phone: ${phone},
active: ${active},
loading: ${loading},
signupSuccess: ${signupSuccess},
nameValid: ${nameValid},
phoneValid: ${phoneValid},
addressValid: ${addressValid},
activeValid: ${activeValid},
signUpPressed: ${signUpPressed},
updatePressed: ${updatePressed}
    ''';
  }
}
