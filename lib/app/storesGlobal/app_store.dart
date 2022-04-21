import 'package:avatende/app/enums/user-type.dart';
import 'package:avatende/app/models/views/company_view_model.dart';
import 'package:avatende/app/models/views/department_view_model.dart';
import 'package:avatende/app/models/views/user_view_model.dart';
import 'package:avatende/app/repositories/company/company_repository.dart';
import 'package:avatende/app/repositories/user/user_repository.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;

final fileUrlDefault =
    "https://cdn1.iconfinder.com/data/icons/rounded-black-basic-ui/139/Photo_Add-RoundedBlack-512.png";

abstract class _AppStoreBase with Store {
  final _repositoryUser = new UserRepository();
  final _companyRepository = new CompanyRepository();

  @observable
  bool producao;

  @observable
  UserViewModel userViewModel;

  @observable
  CompanyViewModel companyViewModel;

  @observable
  DepartmentViewModel departmentViewModel;

  @action
  void setProducao(bool value) => producao = value;

  @action
  void setUser(UserViewModel value) => userViewModel = value;

  @action
  void setCompany(CompanyViewModel value) => companyViewModel = value;

  @action
  void setDepartment(DepartmentViewModel value) => departmentViewModel = value;

  @action
  Future<void> getUser() async {
    var user = await _repositoryUser.getUser(
        userId: userViewModel.userId(), userType: userViewModel.userType);

    setUser(user);
  }

  @action
  Future<void> updateImageProfile() async {
    if (userViewModel.imageFile != null) {
      var fileName = "${userViewModel.email}-${DateTime.now()}";

      var uploadTask = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child(userViewModel.userId())
          .child(fileName)
          .putFile(userViewModel.imageFile);

      var snapshot = await uploadTask.onComplete;
      var profileImageUrl = await snapshot.ref.getDownloadURL();

      userViewModel.image = profileImageUrl.toString();

      var result = await _repositoryUser.updateUser(
          userId: userViewModel.userId(),
          userData: userViewModel.toMap(),
          userType: userViewModel.userType);

      if (!result) userViewModel.image = "";
    }
  }

  @action
  Future<void> getCompanyAndDepartment() async {
    var map = await _companyRepository.getCompanyAndDepartment(
        userViewModel: userViewModel);

    setCompany(map['Company']);

    if (userViewModel.userType == UserType.User) {
      setDepartment(map['Department']);
    }
  }
}
