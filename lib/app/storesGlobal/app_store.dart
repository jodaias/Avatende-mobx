import 'dart:io';

import 'package:avatende/app/enums/user-type.dart';
import 'package:avatende/app/models/views/company_view_model.dart';
import 'package:avatende/app/models/views/department_view_model.dart';
import 'package:avatende/app/models/views/upload_image.dart';
import 'package:avatende/app/models/views/user_view_model.dart';
import 'package:avatende/app/pages/root/root_page.dart';
import 'package:avatende/app/repositories/company/company_repository.dart';
import 'package:avatende/app/repositories/user/user_repository.dart';

//TODO:REMOVER IMPORTS FIREBASE
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;

abstract class _AppStoreBase with Store {
  final _repositoryUser = new UserRepository();
  final _companyRepository = new CompanyRepository();

  @observable
  UserViewModel? userViewModel;

  @observable
  CompanyViewModel? companyViewModel;

  @observable
  DepartmentViewModel? departmentViewModel;

  @observable
  List<File> imageFiles = <File>[];

  @action
  void setUser(UserViewModel value) => userViewModel = value;

  @action
  void setCompany(CompanyViewModel value) => companyViewModel = value;

  @action
  void setDepartment(DepartmentViewModel value) => departmentViewModel = value;

  @action
  void setImageFiles(List<File> value) => imageFiles = value;

  @action
  Future<void> getUser() async {
    var user = await _repositoryUser.getUser();
    setUser(user);
  }

  @action
  Future<void> getCompanyAndDepartment() async {
    var map = await _companyRepository.getCompanyAndDepartment(
        userViewModel: userViewModel!);
    if (map != null && map.isNotEmpty) {
      setCompany(map['Company']);

      if (userViewModel!.userType == UserType.User) {
        setDepartment(map['Department']);
      }
    }
  }

  @computed
  bool get isAuthenticated => _repositoryUser.isAuthenticated();

  @action
  Future<void> signOut(BuildContext context) async {
    await _repositoryUser.signOut();
    userViewModel = new UserViewModel();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => RootPage()));
  }

  @action
  Future<void> showDialogGetImage(BuildContext ctx) async {
    await showModalBottomSheet(
      context: ctx,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('From Gallery'),
                onTap: () async {
                  await _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('From Camera'),
                onTap: () async {
                  await _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @action
  Future<String> uploadImageFileInStorage(
      BuildContext ctx, ImageUploadModel imageUploadModel) async {
    var urlResult = "";
    // upload to DB
    try {
      urlResult = await _updateImage(imageUploadModel);
    } catch (e) {}
    return urlResult;
  }

//Methods privates
  @action
  Future<void> _pickImage(ImageSource source) async {
    var file = await ImagePicker().pickImage(source: source);
    if (file == null) return;
    imageFiles.add(File(file.path));
    setImageFiles(imageFiles);
  }

  @action
  Future<String> _updateImage(ImageUploadModel imageUploadModel) async {
    var uploadTask = FirebaseStorage.instance
        .ref()
        .child(imageUploadModel.folder)
        .child(imageUploadModel.subFolder)
        .child(imageUploadModel.fileName)
        .putFile(imageUploadModel.fileToUpload);

    var profileImageUrl = await uploadTask.snapshot.ref.getDownloadURL();
    return profileImageUrl;
  }

  bool userMasterHasAccessGranted() =>
      userViewModel != null &&
      userViewModel?.userType == UserType.Master &&
      userViewModel?.active == true;

  bool userAdminHasAccessGranted() =>
      userViewModel != null &&
      userViewModel?.userType == UserType.Admin &&
      companyViewModel?.active == true &&
      userViewModel?.active == true;

  bool userHasAccessGranted() =>
      userViewModel != null &&
      userViewModel?.userType == UserType.User &&
      companyViewModel?.active == true &&
      departmentViewModel?.active == true &&
      userViewModel?.active == true;
}
