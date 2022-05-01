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

  final _$imagesAtom = Atom(name: '_CompanyStoreBase.images');

  @override
  List<String> get images {
    _$imagesAtom.reportRead();
    return super.images;
  }

  @override
  set images(List<String> value) {
    _$imagesAtom.reportWrite(value, super.images, () {
      super.images = value;
    });
  }

  final _$companyIdAtom = Atom(name: '_CompanyStoreBase.companyId');

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

  final _$imageFileAtom = Atom(name: '_CompanyStoreBase.imageFile');

  @override
  File get imageFile {
    _$imageFileAtom.reportRead();
    return super.imageFile;
  }

  @override
  set imageFile(File value) {
    _$imageFileAtom.reportWrite(value, super.imageFile, () {
      super.imageFile = value;
    });
  }

  final _$saveImagesSuccessAtom =
      Atom(name: '_CompanyStoreBase.saveImagesSuccess');

  @override
  bool get saveImagesSuccess {
    _$saveImagesSuccessAtom.reportRead();
    return super.saveImagesSuccess;
  }

  @override
  set saveImagesSuccess(bool value) {
    _$saveImagesSuccessAtom.reportWrite(value, super.saveImagesSuccess, () {
      super.saveImagesSuccess = value;
    });
  }

  final _$saveImagesAsyncAction = AsyncAction('_CompanyStoreBase.saveImages');

  @override
  Future<void> saveImages() {
    return _$saveImagesAsyncAction.run(() => super.saveImages());
  }

  final _$updateCompanyAsyncAction =
      AsyncAction('_CompanyStoreBase.updateCompany');

  @override
  Future<void> updateCompany(
      String companyId, Map<String, dynamic> companyData) {
    return _$updateCompanyAsyncAction
        .run(() => super.updateCompany(companyId, companyData));
  }

  final _$_CompanyStoreBaseActionController =
      ActionController(name: '_CompanyStoreBase');

  @override
  void setCompanyId(String value) {
    final _$actionInfo = _$_CompanyStoreBaseActionController.startAction(
        name: '_CompanyStoreBase.setCompanyId');
    try {
      return super.setCompanyId(value);
    } finally {
      _$_CompanyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImageFile(File value) {
    final _$actionInfo = _$_CompanyStoreBaseActionController.startAction(
        name: '_CompanyStoreBase.setImageFile');
    try {
      return super.setImageFile(value);
    } finally {
      _$_CompanyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImages(List<String> value) {
    final _$actionInfo = _$_CompanyStoreBaseActionController.startAction(
        name: '_CompanyStoreBase.setImages');
    try {
      return super.setImages(value);
    } finally {
      _$_CompanyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
  void setSaveImagesSuccess(bool value) {
    final _$actionInfo = _$_CompanyStoreBaseActionController.startAction(
        name: '_CompanyStoreBase.setSaveImagesSuccess');
    try {
      return super.setSaveImagesSuccess(value);
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
images: ${images},
companyId: ${companyId},
imageFile: ${imageFile},
saveImagesSuccess: ${saveImagesSuccess},
companyList: ${companyList}
    ''';
  }
}
