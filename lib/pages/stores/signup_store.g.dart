// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpStore on _SignUpStoreBase, Store {
  Computed<bool> _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: '_SignUpStoreBase.nameValid'))
          .value;
  Computed<bool> _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_SignUpStoreBase.emailValid'))
          .value;
  Computed<bool> _$phoneValidComputed;

  @override
  bool get phoneValid =>
      (_$phoneValidComputed ??= Computed<bool>(() => super.phoneValid,
              name: '_SignUpStoreBase.phoneValid'))
          .value;
  Computed<bool> _$userTypeValidComputed;

  @override
  bool get userTypeValid =>
      (_$userTypeValidComputed ??= Computed<bool>(() => super.userTypeValid,
              name: '_SignUpStoreBase.userTypeValid'))
          .value;
  Computed<bool> _$password1ValidComputed;

  @override
  bool get password1Valid =>
      (_$password1ValidComputed ??= Computed<bool>(() => super.password1Valid,
              name: '_SignUpStoreBase.password1Valid'))
          .value;
  Computed<bool> _$password2ValidComputed;

  @override
  bool get password2Valid =>
      (_$password2ValidComputed ??= Computed<bool>(() => super.password2Valid,
              name: '_SignUpStoreBase.password2Valid'))
          .value;
  Computed<bool> _$formValidComputed;

  @override
  bool get formValid =>
      (_$formValidComputed ??= Computed<bool>(() => super.formValid,
              name: '_SignUpStoreBase.formValid'))
          .value;
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_SignUpStoreBase.isLoading'))
          .value;

  final _$loadingAtom = Atom(name: '_SignUpStoreBase.loading');

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

  final _$phoneAtom = Atom(name: '_SignUpStoreBase.phone');

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

  final _$userTypeAtom = Atom(name: '_SignUpStoreBase.userType');

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

  final _$password1Atom = Atom(name: '_SignUpStoreBase.password1');

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

  final _$password2Atom = Atom(name: '_SignUpStoreBase.password2');

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

  final _$nameAtom = Atom(name: '_SignUpStoreBase.name');

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

  final _$emailAtom = Atom(name: '_SignUpStoreBase.email');

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

  final _$isObscureTextAtom = Atom(name: '_SignUpStoreBase.isObscureText');

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

  final _$_SignUpStoreBaseActionController =
      ActionController(name: '_SignUpStoreBase');

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword1(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setPassword1');
    try {
      return super.setPassword1(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword2(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setPassword2');
    try {
      return super.setPassword2(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserType(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setUserType');
    try {
      return super.setUserType(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObscureText() {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setObscureText');
    try {
      return super.setObscureText();
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(dynamic value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
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
isObscureText: ${isObscureText},
nameValid: ${nameValid},
emailValid: ${emailValid},
phoneValid: ${phoneValid},
userTypeValid: ${userTypeValid},
password1Valid: ${password1Valid},
password2Valid: ${password2Valid},
formValid: ${formValid},
isLoading: ${isLoading}
    ''';
  }
}
