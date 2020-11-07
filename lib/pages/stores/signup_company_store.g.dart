// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_company_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignupCompanyStore on _SignupCompanyStoreBase, Store {
  Computed<bool> _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: '_SignupCompanyStoreBase.nameValid'))
          .value;
  Computed<bool> _$phoneValidComputed;

  @override
  bool get phoneValid =>
      (_$phoneValidComputed ??= Computed<bool>(() => super.phoneValid,
              name: '_SignupCompanyStoreBase.phoneValid'))
          .value;
  Computed<bool> _$formValidComputed;

  @override
  bool get formValid =>
      (_$formValidComputed ??= Computed<bool>(() => super.formValid,
              name: '_SignupCompanyStoreBase.formValid'))
          .value;

  final _$nameAtom = Atom(name: '_SignupCompanyStoreBase.name');

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

  final _$loadingAtom = Atom(name: '_SignupCompanyStoreBase.loading');

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

  final _$phoneAtom = Atom(name: '_SignupCompanyStoreBase.phone');

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

  final _$_SignupCompanyStoreBaseActionController =
      ActionController(name: '_SignupCompanyStoreBase');

  @override
  void setName(String value) {
    final _$actionInfo = _$_SignupCompanyStoreBaseActionController.startAction(
        name: '_SignupCompanyStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_SignupCompanyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_SignupCompanyStoreBaseActionController.startAction(
        name: '_SignupCompanyStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_SignupCompanyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
loading: ${loading},
phone: ${phone},
nameValid: ${nameValid},
phoneValid: ${phoneValid},
formValid: ${formValid}
    ''';
  }
}
