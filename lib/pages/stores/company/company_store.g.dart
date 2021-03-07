// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CompanyStore on _CompanyStoreBase, Store {
  Computed<dynamic> _$companyListComputed;

  @override
  dynamic get companyList =>
      (_$companyListComputed ??= Computed<dynamic>(() => super.companyList,
              name: '_CompanyStoreBase.companyList'))
          .value;
  Computed<dynamic> _$companyListInactiveComputed;

  @override
  dynamic get companyListInactive => (_$companyListInactiveComputed ??=
          Computed<dynamic>(() => super.companyListInactive,
              name: '_CompanyStoreBase.companyListInactive'))
      .value;

  final _$loadingAtom = Atom(name: '_CompanyStoreBase.loading');

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

  final _$orderByAzAtom = Atom(name: '_CompanyStoreBase.orderByAz');

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

  final _$listActiveAtom = Atom(name: '_CompanyStoreBase.listActive');

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

  final _$_CompanyStoreBaseActionController =
      ActionController(name: '_CompanyStoreBase');

  @override
  void setOrderByAz(bool value) {
    final _$actionInfo = _$_CompanyStoreBaseActionController.startAction(
        name: '_CompanyStoreBase.setOrderByAz');
    try {
      return super.setOrderByAz(value);
    } finally {
      _$_CompanyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListActive(bool value) {
    final _$actionInfo = _$_CompanyStoreBaseActionController.startAction(
        name: '_CompanyStoreBase.setListActive');
    try {
      return super.setListActive(value);
    } finally {
      _$_CompanyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
orderByAz: ${orderByAz},
listActive: ${listActive},
companyList: ${companyList},
companyListInactive: ${companyListInactive}
    ''';
  }
}
