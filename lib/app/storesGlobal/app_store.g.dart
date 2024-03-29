// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on _AppStoreBase, Store {
  Computed<bool>? _$isAuthenticatedComputed;

  @override
  bool get isAuthenticated =>
      (_$isAuthenticatedComputed ??= Computed<bool>(() => super.isAuthenticated,
              name: '_AppStoreBase.isAuthenticated'))
          .value;

  late final _$userViewModelAtom =
      Atom(name: '_AppStoreBase.userViewModel', context: context);

  @override
  UserViewModel? get userViewModel {
    _$userViewModelAtom.reportRead();
    return super.userViewModel;
  }

  @override
  set userViewModel(UserViewModel? value) {
    _$userViewModelAtom.reportWrite(value, super.userViewModel, () {
      super.userViewModel = value;
    });
  }

  late final _$companyViewModelAtom =
      Atom(name: '_AppStoreBase.companyViewModel', context: context);

  @override
  CompanyViewModel? get companyViewModel {
    _$companyViewModelAtom.reportRead();
    return super.companyViewModel;
  }

  @override
  set companyViewModel(CompanyViewModel? value) {
    _$companyViewModelAtom.reportWrite(value, super.companyViewModel, () {
      super.companyViewModel = value;
    });
  }

  late final _$departmentViewModelAtom =
      Atom(name: '_AppStoreBase.departmentViewModel', context: context);

  @override
  DepartmentViewModel? get departmentViewModel {
    _$departmentViewModelAtom.reportRead();
    return super.departmentViewModel;
  }

  @override
  set departmentViewModel(DepartmentViewModel? value) {
    _$departmentViewModelAtom.reportWrite(value, super.departmentViewModel, () {
      super.departmentViewModel = value;
    });
  }

  late final _$imageFilesAtom =
      Atom(name: '_AppStoreBase.imageFiles', context: context);

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

  late final _$getUserAsyncAction =
      AsyncAction('_AppStoreBase.getUser', context: context);

  @override
  Future<void> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  late final _$getCompanyAndDepartmentAsyncAction =
      AsyncAction('_AppStoreBase.getCompanyAndDepartment', context: context);

  @override
  Future<void> getCompanyAndDepartment() {
    return _$getCompanyAndDepartmentAsyncAction
        .run(() => super.getCompanyAndDepartment());
  }

  late final _$signOutAsyncAction =
      AsyncAction('_AppStoreBase.signOut', context: context);

  @override
  Future<void> signOut(BuildContext context) {
    return _$signOutAsyncAction.run(() => super.signOut(context));
  }

  late final _$showDialogGetImageAsyncAction =
      AsyncAction('_AppStoreBase.showDialogGetImage', context: context);

  @override
  Future<void> showDialogGetImage(BuildContext ctx) {
    return _$showDialogGetImageAsyncAction
        .run(() => super.showDialogGetImage(ctx));
  }

  late final _$uploadImageFileInStorageAsyncAction =
      AsyncAction('_AppStoreBase.uploadImageFileInStorage', context: context);

  @override
  Future<String> uploadImageFileInStorage(
      BuildContext ctx, ImageUploadModel imageUploadModel) {
    return _$uploadImageFileInStorageAsyncAction
        .run(() => super.uploadImageFileInStorage(ctx, imageUploadModel));
  }

  late final _$_pickImageAsyncAction =
      AsyncAction('_AppStoreBase._pickImage', context: context);

  @override
  Future<void> _pickImage(ImageSource source) {
    return _$_pickImageAsyncAction.run(() => super._pickImage(source));
  }

  late final _$_updateImageAsyncAction =
      AsyncAction('_AppStoreBase._updateImage', context: context);

  @override
  Future<String> _updateImage(ImageUploadModel imageUploadModel) {
    return _$_updateImageAsyncAction
        .run(() => super._updateImage(imageUploadModel));
  }

  late final _$_AppStoreBaseActionController =
      ActionController(name: '_AppStoreBase', context: context);

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
userViewModel: ${userViewModel},
companyViewModel: ${companyViewModel},
departmentViewModel: ${departmentViewModel},
imageFiles: ${imageFiles},
isAuthenticated: ${isAuthenticated}
    ''';
  }
}
