// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStoreBase, Store {
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_LoginStoreBase.emailValid'))
          .value;
  Computed<bool>? _$passwordValidComputed;

  @override
  bool get passwordValid =>
      (_$passwordValidComputed ??= Computed<bool>(() => super.passwordValid,
              name: '_LoginStoreBase.passwordValid'))
          .value;
  Computed<VoidCallback?>? _$loginPressedComputed;

  @override
  VoidCallback? get loginPressed => (_$loginPressedComputed ??=
          Computed<VoidCallback?>(() => super.loginPressed,
              name: '_LoginStoreBase.loginPressed'))
      .value;
  Computed<VoidCallback?>? _$resetPasswordPressedComputed;

  @override
  VoidCallback? get resetPasswordPressed => (_$resetPasswordPressedComputed ??=
          Computed<VoidCallback?>(() => super.resetPasswordPressed,
              name: '_LoginStoreBase.resetPasswordPressed'))
      .value;

  late final _$emailAtom =
      Atom(name: '_LoginStoreBase.email', context: context);

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

  late final _$passwordAtom =
      Atom(name: '_LoginStoreBase.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_LoginStoreBase.loading', context: context);

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

  late final _$loggedInAtom =
      Atom(name: '_LoginStoreBase.loggedIn', context: context);

  @override
  bool? get loggedIn {
    _$loggedInAtom.reportRead();
    return super.loggedIn;
  }

  @override
  set loggedIn(bool? value) {
    _$loggedInAtom.reportWrite(value, super.loggedIn, () {
      super.loggedIn = value;
    });
  }

  late final _$resetPassAtom =
      Atom(name: '_LoginStoreBase.resetPass', context: context);

  @override
  bool? get resetPass {
    _$resetPassAtom.reportRead();
    return super.resetPass;
  }

  @override
  set resetPass(bool? value) {
    _$resetPassAtom.reportWrite(value, super.resetPass, () {
      super.resetPass = value;
    });
  }

  late final _$isObscureTextAtom =
      Atom(name: '_LoginStoreBase.isObscureText', context: context);

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

  late final _$loginAsyncAction =
      AsyncAction('_LoginStoreBase.login', context: context);

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$resetPasswordAsyncAction =
      AsyncAction('_LoginStoreBase.resetPassword', context: context);

  @override
  Future<void> resetPassword() {
    return _$resetPasswordAsyncAction.run(() => super.resetPassword());
  }

  late final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObscureText() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setObscureText');
    try {
      return super.setObscureText();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
loading: ${loading},
loggedIn: ${loggedIn},
resetPass: ${resetPass},
isObscureText: ${isObscureText},
emailValid: ${emailValid},
passwordValid: ${passwordValid},
loginPressed: ${loginPressed},
resetPasswordPressed: ${resetPasswordPressed}
    ''';
  }
}
