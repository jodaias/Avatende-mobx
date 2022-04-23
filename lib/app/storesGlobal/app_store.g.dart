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

  final _$companyViewModelAtom = Atom(name: '_AppStoreBase.companyViewModel');

  @override
  CompanyViewModel get companyViewModel {
    _$companyViewModelAtom.reportRead();
    return super.companyViewModel;
  }

  @override
  set companyViewModel(CompanyViewModel value) {
    _$companyViewModelAtom.reportWrite(value, super.companyViewModel, () {
      super.companyViewModel = value;
    });
  }

  final _$departmentViewModelAtom =
      Atom(name: '_AppStoreBase.departmentViewModel');

  @override
  DepartmentViewModel get departmentViewModel {
    _$departmentViewModelAtom.reportRead();
    return super.departmentViewModel;
  }

  @override
  set departmentViewModel(DepartmentViewModel value) {
    _$departmentViewModelAtom.reportWrite(value, super.departmentViewModel, () {
      super.departmentViewModel = value;
    });
  }

  final _$imageFilesAtom = Atom(name: '_AppStoreBase.imageFiles');

  @override
  List<File> get imageFiles {
    _$imageFilesAtom.reportRead();
    return super.imageFiles;
  }

  @override
  set imageFiles(List<File> value) {
    _$imageFilesAtom.reportWrite(value, super.imageFiles, () {
      super.imageFiles = value;
    });
  }

  final _$getUserAsyncAction = AsyncAction('_AppStoreBase.getUser');

  @override
  Future<void> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$getCompanyAndDepartmentAsyncAction =
      AsyncAction('_AppStoreBase.getCompanyAndDepartment');

  @override
  Future<void> getCompanyAndDepartment() {
    return _$getCompanyAndDepartmentAsyncAction
        .run(() => super.getCompanyAndDepartment());
  }

  final _$showDialogGetImageAsyncAction =
      AsyncAction('_AppStoreBase.showDialogGetImage');

  @override
  Future<void> showDialogGetImage(BuildContext ctx) {
    return _$showDialogGetImageAsyncAction
        .run(() => super.showDialogGetImage(ctx));
  }

  final _$uploadImageFileInStorageAsyncAction =
      AsyncAction('_AppStoreBase.uploadImageFileInStorage');

  @override
  Future<String> uploadImageFileInStorage(
      BuildContext ctx, ImageUploadModel imageUploadModel) {
    return _$uploadImageFileInStorageAsyncAction
        .run(() => super.uploadImageFileInStorage(ctx, imageUploadModel));
  }

  final _$_pickImageAsyncAction = AsyncAction('_AppStoreBase._pickImage');

  @override
  Future<void> _pickImage(ImageSource source) {
    return _$_pickImageAsyncAction.run(() => super._pickImage(source));
  }

  final _$_updateImageAsyncAction = AsyncAction('_AppStoreBase._updateImage');

  @override
  Future<String> _updateImage(ImageUploadModel imageUploadModel) {
    return _$_updateImageAsyncAction
        .run(() => super._updateImage(imageUploadModel));
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
  void setCompany(CompanyViewModel value) {
    final _$actionInfo = _$_AppStoreBaseActionController.startAction(
        name: '_AppStoreBase.setCompany');
    try {
      return super.setCompany(value);
    } finally {
      _$_AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDepartment(DepartmentViewModel value) {
    final _$actionInfo = _$_AppStoreBaseActionController.startAction(
        name: '_AppStoreBase.setDepartment');
    try {
      return super.setDepartment(value);
    } finally {
      _$_AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImageFiles(List<File> value) {
    final _$actionInfo = _$_AppStoreBaseActionController.startAction(
        name: '_AppStoreBase.setImageFiles');
    try {
      return super.setImageFiles(value);
    } finally {
      _$_AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
producao: ${producao},
userViewModel: ${userViewModel},
companyViewModel: ${companyViewModel},
departmentViewModel: ${departmentViewModel},
imageFiles: ${imageFiles}
    ''';
  }
}
