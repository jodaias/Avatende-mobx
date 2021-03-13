// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpUserStore on _SignUpUserStoreBase, Store {
  Computed<bool> _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: '_SignUpUserStoreBase.nameValid'))
          .value;
  Computed<bool> _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_SignUpUserStoreBase.emailValid'))
          .value;
  Computed<bool> _$phoneValidComputed;

  @override
  bool get phoneValid =>
      (_$phoneValidComputed ??= Computed<bool>(() => super.phoneValid,
              name: '_SignUpUserStoreBase.phoneValid'))
          .value;
  Computed<bool> _$addressValidComputed;

  @override
  bool get addressValid =>
      (_$addressValidComputed ??= Computed<bool>(() => super.addressValid,
              name: '_SignUpUserStoreBase.addressValid'))
          .value;
  Computed<bool> _$userTypeValidComputed;

  @override
  bool get userTypeValid =>
      (_$userTypeValidComputed ??= Computed<bool>(() => super.userTypeValid,
              name: '_SignUpUserStoreBase.userTypeValid'))
          .value;
  Computed<bool> _$password1ValidComputed;

  @override
  bool get password1Valid =>
      (_$password1ValidComputed ??= Computed<bool>(() => super.password1Valid,
              name: '_SignUpUserStoreBase.password1Valid'))
          .value;
  Computed<bool> _$password2ValidComputed;

  @override
  bool get password2Valid =>
      (_$password2ValidComputed ??= Computed<bool>(() => super.password2Valid,
              name: '_SignUpUserStoreBase.password2Valid'))
          .value;
  Computed<Function> _$signUpPressedComputed;

  @override
  Function get signUpPressed =>
      (_$signUpPressedComputed ??= Computed<Function>(() => super.signUpPressed,
              name: '_SignUpUserStoreBase.signUpPressed'))
          .value;

  final _$loadingAtom = Atom(name: '_SignUpUserStoreBase.loading');

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

  final _$phoneAtom = Atom(name: '_SignUpUserStoreBase.phone');

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

  final _$userTypeAtom = Atom(name: '_SignUpUserStoreBase.userType');

  @override
  String get userType {
    _$userTypeAtom.reportRead();
    return super.userType;
  }

  @override
  set userType(String value) {
    _$userTypeAtom.reportWrite(value, super.userType, () {
      super.userType = value;
    });
  }

  final _$password1Atom = Atom(name: '_SignUpUserStoreBase.password1');

  @override
  String get password1 {
    _$password1Atom.reportRead();
    return super.password1;
  }

  @override
  set password1(String value) {
    _$password1Atom.reportWrite(value, super.password1, () {
      super.password1 = value;
    });
  }

  final _$password2Atom = Atom(name: '_SignUpUserStoreBase.password2');

  @override
  String get password2 {
    _$password2Atom.reportRead();
    return super.password2;
  }

  @override
  set password2(String value) {
    _$password2Atom.reportWrite(value, super.password2, () {
      super.password2 = value;
    });
  }

  final _$nameAtom = Atom(name: '_SignUpUserStoreBase.name');

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

  final _$emailAtom = Atom(name: '_SignUpUserStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$activeAtom = Atom(name: '_SignUpUserStoreBase.active');

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

  final _$addressAtom = Atom(name: '_SignUpUserStoreBase.address');

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

  final _$departmentIdAtom = Atom(name: '_SignUpUserStoreBase.departmentId');

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

  final _$companyIdAtom = Atom(name: '_SignUpUserStoreBase.companyId');

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

  final _$signupSuccessAtom = Atom(name: '_SignUpUserStoreBase.signupSuccess');

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

  final _$isObscureTextAtom = Atom(name: '_SignUpUserStoreBase.isObscureText');

  @override
  bool get isObscureText {
    _$isObscureTextAtom.reportRead();
    return super.isObscureText;
  }

  @override
  set isObscureText(bool value) {
    _$isObscureTextAtom.reportWrite(value, super.isObscureText, () {
      super.isObscureText = value;
    });
  }

  final _$orderByAzAtom = Atom(name: '_SignUpUserStoreBase.orderByAz');

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

  final _$listActiveAtom = Atom(name: '_SignUpUserStoreBase.listActive');

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

  final _$signUpAsyncAction = AsyncAction('_SignUpUserStoreBase.signUp');

  @override
  Future<void> signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  final _$_SignUpUserStoreBaseActionController =
      ActionController(name: '_SignUpUserStoreBase');

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignUpUserStoreBaseActionController.startAction(
        name: '_SignUpUserStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignUpUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword1(String value) {
    final _$actionInfo = _$_SignUpUserStoreBaseActionController.startAction(
        name: '_SignUpUserStoreBase.setPassword1');
    try {
      return super.setPassword1(value);
    } finally {
      _$_SignUpUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword2(String value) {
    final _$actionInfo = _$_SignUpUserStoreBaseActionController.startAction(
        name: '_SignUpUserStoreBase.setPassword2');
    try {
      return super.setPassword2(value);
    } finally {
      _$_SignUpUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$_SignUpUserStoreBaseActionController.startAction(
        name: '_SignUpUserStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_SignUpUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAddress(String value) {
    final _$actionInfo = _$_SignUpUserStoreBaseActionController.startAction(
        name: '_SignUpUserStoreBase.setAddress');
    try {
      return super.setAddress(value);
    } finally {
      _$_SignUpUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_SignUpUserStoreBaseActionController.startAction(
        name: '_SignUpUserStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_SignUpUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserType(String value) {
    final _$actionInfo = _$_SignUpUserStoreBaseActionController.startAction(
        name: '_SignUpUserStoreBase.setUserType');
    try {
      return super.setUserType(value);
    } finally {
      _$_SignUpUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setActive(bool value) {
    final _$actionInfo = _$_SignUpUserStoreBaseActionController.startAction(
        name: '_SignUpUserStoreBase.setActive');
    try {
      return super.setActive(value);
    } finally {
      _$_SignUpUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObscureText() {
    final _$actionInfo = _$_SignUpUserStoreBaseActionController.startAction(
        name: '_SignUpUserStoreBase.setObscureText');
    try {
      return super.setObscureText();
    } finally {
      _$_SignUpUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(dynamic value) {
    final _$actionInfo = _$_SignUpUserStoreBaseActionController.startAction(
        name: '_SignUpUserStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_SignUpUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOrderByAz(bool value) {
    final _$actionInfo = _$_SignUpUserStoreBaseActionController.startAction(
        name: '_SignUpUserStoreBase.setOrderByAz');
    try {
      return super.setOrderByAz(value);
    } finally {
      _$_SignUpUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListActive(bool value) {
    final _$actionInfo = _$_SignUpUserStoreBaseActionController.startAction(
        name: '_SignUpUserStoreBase.setListActive');
    try {
      return super.setListActive(value);
    } finally {
      _$_SignUpUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDepartmentId(String value) {
    final _$actionInfo = _$_SignUpUserStoreBaseActionController.startAction(
        name: '_SignUpUserStoreBase.setDepartmentId');
    try {
      return super.setDepartmentId(value);
    } finally {
      _$_SignUpUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCompanyId(String value) {
    final _$actionInfo = _$_SignUpUserStoreBaseActionController.startAction(
        name: '_SignUpUserStoreBase.setCompanyId');
    try {
      return super.setCompanyId(value);
    } finally {
      _$_SignUpUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
phone: ${phone},
userType: ${userType},
password1: ${password1},
password2: ${password2},
name: ${name},
email: ${email},
active: ${active},
address: ${address},
departmentId: ${departmentId},
companyId: ${companyId},
signupSuccess: ${signupSuccess},
isObscureText: ${isObscureText},
orderByAz: ${orderByAz},
listActive: ${listActive},
nameValid: ${nameValid},
emailValid: ${emailValid},
phoneValid: ${phoneValid},
addressValid: ${addressValid},
userTypeValid: ${userTypeValid},
password1Valid: ${password1Valid},
password2Valid: ${password2Valid},
signUpPressed: ${signUpPressed}
    ''';
  }
}
