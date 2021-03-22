// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on _AppStoreBase, Store {
  final _$producaoAtom = Atom(name: '_AppStoreBase.producao');

  @override
  bool get producao {
    _$producaoAtom.reportRead();
    return super.producao;
  }

  @override
  set producao(bool value) {
    _$producaoAtom.reportWrite(value, super.producao, () {
      super.producao = value;
    });
  }

  final _$userViewModelAtom = Atom(name: '_AppStoreBase.userViewModel');

  @override
  UserViewModel get userViewModel {
    _$userViewModelAtom.reportRead();
    return super.userViewModel;
  }

  @override
  set userViewModel(UserViewModel value) {
    _$userViewModelAtom.reportWrite(value, super.userViewModel, () {
      super.userViewModel = value;
    });
  }

  final _$companyIdAtom = Atom(name: '_AppStoreBase.companyId');

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

  final _$getUserAsyncAction = AsyncAction('_AppStoreBase.getUser');

  @override
  Future<void> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$getCompanyIdAsyncAction = AsyncAction('_AppStoreBase.getCompanyId');

  @override
  Future<void> getCompanyId() {
    return _$getCompanyIdAsyncAction.run(() => super.getCompanyId());
  }

  final _$_AppStoreBaseActionController =
      ActionController(name: '_AppStoreBase');

  @override
  void setProducao(bool value) {
    final _$actionInfo = _$_AppStoreBaseActionController.startAction(
        name: '_AppStoreBase.setProducao');
    try {
      return super.setProducao(value);
    } finally {
      _$_AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUser(UserViewModel value) {
    final _$actionInfo = _$_AppStoreBaseActionController.startAction(
        name: '_AppStoreBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCompanyId(String value) {
    final _$actionInfo = _$_AppStoreBaseActionController.startAction(
        name: '_AppStoreBase.setCompanyId');
    try {
      return super.setCompanyId(value);
    } finally {
      _$_AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
producao: ${producao},
userViewModel: ${userViewModel},
companyId: ${companyId}
    ''';
  }
}
