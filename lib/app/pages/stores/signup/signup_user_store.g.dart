// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpUserStore on _SignUpUserStoreBase, Store {
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: '_SignUpUserStoreBase.nameValid'))
          .value;
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_SignUpUserStoreBase.emailValid'))
          .value;
  Computed<bool>? _$activeValidComputed;

  @override
  bool get activeValid =>
      (_$activeValidComputed ??= Computed<bool>(() => super.activeValid,
              name: '_SignUpUserStoreBase.activeValid'))
          .value;
  Computed<bool>? _$userTypeValidComputed;

  @override
  bool get userTypeValid =>
      (_$userTypeValidComputed ??= Computed<bool>(() => super.userTypeValid,
              name: '_SignUpUserStoreBase.userTypeValid'))
          .value;
  Computed<bool>? _$password1ValidComputed;

  @override
  bool get password1Valid =>
      (_$password1ValidComputed ??= Computed<bool>(() => super.password1Valid,
              name: '_SignUpUserStoreBase.password1Valid'))
          .value;
  Computed<bool>? _$password2ValidComputed;

  @override
  bool get password2Valid =>
      (_$password2ValidComputed ??= Computed<bool>(() => super.password2Valid,
              name: '_SignUpUserStoreBase.password2Valid'))
          .value;
  Computed<VoidCallback?>? _$signUpPressedComputed;

  @override
  VoidCallback? get signUpPressed => (_$signUpPressedComputed ??=
          Computed<VoidCallback?>(() => super.signUpPressed,
              name: '_SignUpUserStoreBase.signUpPressed'))
      .value;
  Computed<VoidCallback?>? _$updatePressedComputed;

  @override
  VoidCallback? get updatePressed => (_$updatePressedComputed ??=
          Computed<VoidCallback?>(() => super.updatePressed,
              name: '_SignUpUserStoreBase.updatePressed'))
      .value;

  late final _$loadingAtom =
      Atom(name: '_SignUpUserStoreBase.loading', context: context);

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

  late final _$userTypeAtom =
      Atom(name: '_SignUpUserStoreBase.userType', context: context);

  @override
  UserType? get userType {
    _$userTypeAtom.reportRead();
    return super.userType;
  }

  @override
  set userType(UserType? value) {
    _$userTypeAtom.reportWrite(value, super.userType, () {
      super.userType = value;
    });
  }

  late final _$password1Atom =
      Atom(name: '_SignUpUserStoreBase.password1', context: context);

  @override
  String? get password1 {
    _$password1Atom.reportRead();
    return super.password1;
  }

  @override
  set password1(String? value) {
    _$password1Atom.reportWrite(value, super.password1, () {
      super.password1 = value;
    });
  }

  late final _$password2Atom =
      Atom(name: '_SignUpUserStoreBase.password2', context: context);

  @override
  String? get password2 {
    _$password2Atom.reportRead();
    return super.password2;
  }

  @override
  set password2(String? value) {
    _$password2Atom.reportWrite(value, super.password2, () {
      super.password2 = value;
    });
  }

  late final _$nameAtom =
      Atom(name: '_SignUpUserStoreBase.name', context: context);

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

  late final _$emailAtom =
      Atom(name: '_SignUpUserStoreBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$activeAtom =
      Atom(name: '_SignUpUserStoreBase.active', context: context);

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

  late final _$nivelAtom =
      Atom(name: '_SignUpUserStoreBase.nivel', context: context);

  @override
  bool get nivel {
    _$nivelAtom.reportRead();
    return super.nivel;
  }

  @override
  set nivel(bool value) {
    _$nivelAtom.reportWrite(value, super.nivel, () {
      super.nivel = value;
    });
  }

  late final _$departmentIdAtom =
      Atom(name: '_SignUpUserStoreBase.departmentId', context: context);

  @override
  String? get departmentId {
    _$departmentIdAtom.reportRead();
    return super.departmentId;
  }

  @override
  set departmentId(String? value) {
    _$departmentIdAtom.reportWrite(value, super.departmentId, () {
      super.departmentId = value;
    });
  }

  late final _$companyIdAtom =
      Atom(name: '_SignUpUserStoreBase.companyId', context: context);

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

  late final _$userIdAtom =
      Atom(name: '_SignUpUserStoreBase.userId', context: context);

  @override
  String? get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(String? value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  late final _$signupSuccessAtom =
      Atom(name: '_SignUpUserStoreBase.signupSuccess', context: context);

  @override
  bool? get signupSuccess {
    _$signupSuccessAtom.reportRead();
    return super.signupSuccess;
  }

  @override
  set signupSuccess(bool? value) {
    _$signupSuccessAtom.reportWrite(value, super.signupSuccess, () {
      super.signupSuccess = value;
    });
  }

  late final _$isObscureTextAtom =
      Atom(name: '_SignUpUserStoreBase.isObscureText', context: context);

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

  late final _$orderByAzAtom =
      Atom(name: '_SignUpUserStoreBase.orderByAz', context: context);

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
      Atom(name: '_SignUpUserStoreBase.listActive', context: context);

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

  late final _$userTypesAtom =
      Atom(name: '_SignUpUserStoreBase.userTypes', context: context);

  @override
  List<UserType> get userTypes {
    _$userTypesAtom.reportRead();
    return super.userTypes;
  }

  @override
  set userTypes(List<UserType> value) {
    _$userTypesAtom.reportWrite(value, super.userTypes, () {
      super.userTypes = value;
    });
  }

  late final _$signUpAsyncAction =
      AsyncAction('_SignUpUserStoreBase.signUp', context: context);

  @override
  Future<void> signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  late final _$updateUserAsyncAction =
      AsyncAction('_SignUpUserStoreBase.updateUser', context: context);

  @override
  Future<void> updateUser() {
    return _$updateUserAsyncAction.run(() => super.updateUser());
  }

  late final _$_SignUpUserStoreBaseActionController =
      ActionController(name: '_SignUpUserStoreBase', context: context);

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
  void setUserType(UserType value) {
    final _$actionInfo = _$_SignUpUserStoreBaseActionController.startAction(
        name: '_SignUpUserStoreBase.setUserType');
    try {
      return super.setUserType(value);
    } finally {
      _$_SignUpUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setActive(bool? value) {
    final _$actionInfo = _$_SignUpUserStoreBaseActionController.startAction(
        name: '_SignUpUserStoreBase.setActive');
    try {
      return super.setActive(value);
    } finally {
      _$_SignUpUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNivel(bool value) {
    final _$actionInfo = _$_SignUpUserStoreBaseActionController.startAction(
        name: '_SignUpUserStoreBase.setNivel');
    try {
      return super.setNivel(value);
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
  void setDepartmentId(String? value) {
    final _$actionInfo = _$_SignUpUserStoreBaseActionController.startAction(
        name: '_SignUpUserStoreBase.setDepartmentId');
    try {
      return super.setDepartmentId(value);
    } finally {
      _$_SignUpUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCompanyId(String? value) {
    final _$actionInfo = _$_SignUpUserStoreBaseActionController.startAction(
        name: '_SignUpUserStoreBase.setCompanyId');
    try {
      return super.setCompanyId(value);
    } finally {
      _$_SignUpUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserId(String? value) {
    final _$actionInfo = _$_SignUpUserStoreBaseActionController.startAction(
        name: '_SignUpUserStoreBase.setUserId');
    try {
      return super.setUserId(value);
    } finally {
      _$_SignUpUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserTypes(List<UserType> value) {
    final _$actionInfo = _$_SignUpUserStoreBaseActionController.startAction(
        name: '_SignUpUserStoreBase.setUserTypes');
    try {
      return super.setUserTypes(value);
    } finally {
      _$_SignUpUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
userType: ${userType},
password1: ${password1},
password2: ${password2},
name: ${name},
email: ${email},
active: ${active},
nivel: ${nivel},
departmentId: ${departmentId},
companyId: ${companyId},
userId: ${userId},
signupSuccess: ${signupSuccess},
isObscureText: ${isObscureText},
orderByAz: ${orderByAz},
listActive: ${listActive},
userTypes: ${userTypes},
nameValid: ${nameValid},
emailValid: ${emailValid},
activeValid: ${activeValid},
userTypeValid: ${userTypeValid},
password1Valid: ${password1Valid},
password2Valid: ${password2Valid},
signUpPressed: ${signUpPressed},
updatePressed: ${updatePressed}
    ''';
  }
}
