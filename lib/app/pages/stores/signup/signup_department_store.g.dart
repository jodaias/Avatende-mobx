// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_department_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupDepartmentStore on _SignupDepartmentStoreBase, Store {
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: '_SignupDepartmentStoreBase.nameValid'))
          .value;
  Computed<bool>? _$phoneValidComputed;

  @override
  bool get phoneValid =>
      (_$phoneValidComputed ??= Computed<bool>(() => super.phoneValid,
              name: '_SignupDepartmentStoreBase.phoneValid'))
          .value;
  Computed<bool>? _$activeValidComputed;

  @override
  bool get activeValid =>
      (_$activeValidComputed ??= Computed<bool>(() => super.activeValid,
              name: '_SignupDepartmentStoreBase.activeValid'))
          .value;
  Computed<VoidCallback?>? _$signUpPressedComputed;

  @override
  VoidCallback? get signUpPressed => (_$signUpPressedComputed ??=
          Computed<VoidCallback?>(() => super.signUpPressed,
              name: '_SignupDepartmentStoreBase.signUpPressed'))
      .value;

  late final _$nameAtom =
      Atom(name: '_SignupDepartmentStoreBase.name', context: context);

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

  late final _$phoneAtom =
      Atom(name: '_SignupDepartmentStoreBase.phone', context: context);

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

  late final _$companyIdAtom =
      Atom(name: '_SignupDepartmentStoreBase.companyId', context: context);

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

  late final _$activeAtom =
      Atom(name: '_SignupDepartmentStoreBase.active', context: context);

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
      Atom(name: '_SignupDepartmentStoreBase.loading', context: context);

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
      Atom(name: '_SignupDepartmentStoreBase.signupSuccess', context: context);

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

  late final _$orderByAzAtom =
      Atom(name: '_SignupDepartmentStoreBase.orderByAz', context: context);

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
      Atom(name: '_SignupDepartmentStoreBase.listActive', context: context);

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

  late final _$signUpAsyncAction =
      AsyncAction('_SignupDepartmentStoreBase.signUp', context: context);

  @override
  Future<void> signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  late final _$_SignupDepartmentStoreBaseActionController =
      ActionController(name: '_SignupDepartmentStoreBase', context: context);

  @override
  void setName(String? value) {
    final _$actionInfo = _$_SignupDepartmentStoreBaseActionController
        .startAction(name: '_SignupDepartmentStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_SignupDepartmentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String? value) {
    final _$actionInfo = _$_SignupDepartmentStoreBaseActionController
        .startAction(name: '_SignupDepartmentStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_SignupDepartmentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setActive(bool? value) {
    final _$actionInfo = _$_SignupDepartmentStoreBaseActionController
        .startAction(name: '_SignupDepartmentStoreBase.setActive');
    try {
      return super.setActive(value);
    } finally {
      _$_SignupDepartmentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCompanyId(String? value) {
    final _$actionInfo = _$_SignupDepartmentStoreBaseActionController
        .startAction(name: '_SignupDepartmentStoreBase.setCompanyId');
    try {
      return super.setCompanyId(value);
    } finally {
      _$_SignupDepartmentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOrderByAz(bool value) {
    final _$actionInfo = _$_SignupDepartmentStoreBaseActionController
        .startAction(name: '_SignupDepartmentStoreBase.setOrderByAz');
    try {
      return super.setOrderByAz(value);
    } finally {
      _$_SignupDepartmentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListActive(bool value) {
    final _$actionInfo = _$_SignupDepartmentStoreBaseActionController
        .startAction(name: '_SignupDepartmentStoreBase.setListActive');
    try {
      return super.setListActive(value);
    } finally {
      _$_SignupDepartmentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
phone: ${phone},
companyId: ${companyId},
active: ${active},
loading: ${loading},
signupSuccess: ${signupSuccess},
orderByAz: ${orderByAz},
listActive: ${listActive},
nameValid: ${nameValid},
phoneValid: ${phoneValid},
activeValid: ${activeValid},
signUpPressed: ${signUpPressed}
    ''';
  }
}
