import 'dart:io';

import 'package:avatende/app/repositories/company/company_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobx/mobx.dart';
part 'company_store.g.dart';

enum ActivesOrOrderByCompany {
  actives,
  inactives,
  orderByAZ,
  orderByZA,
}

class CompanyStore = _CompanyStoreBase with _$CompanyStore;

abstract class _CompanyStoreBase with Store {
  //REPOSITÓRIO
  var repository = new CompanyRepository();

  //OBSERVABLES
  @observable
  bool loading = false;

  @observable
  bool orderByAz = true;

  @observable
  bool listActive = true;

  @observable
  List<String> images = <String>[];

  @observable
  List<File> imageFiles = <File>[];

  @observable
  String companyId;

  @observable
  File imageFile;

  //ACTIONS
  @action
  void setCompanyId(String value) => companyId = value;

  @action
  void setImageFile(File value) => imageFile = value;

  @action
  void setImages(List<String> value) => images = value;

  @action
  void setImageFiles(List<File> value) => imageFiles = value;

  @action
  void setOrderByAz(bool value) => orderByAz = value;
  @action
  void setListActive(bool value) => listActive = value;

  @action
  Future<void> addAdsImages() async {
    if (imageFile != null) {
      var fileName = "$companyId-${DateTime.now()}";

      var uploadTask = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child(companyId)
          .child(fileName)
          .putFile(imageFile);

      var snapshot = await uploadTask.onComplete;
      var profileImageUrl = await snapshot.ref.getDownloadURL();

      var image = profileImageUrl.toString();
      images.add(image);
    }
  }

  @action
  Future<void> updateAdsImages() async {
    if (images.isNotEmpty) {
      var companyData = {"Images": images};

      var result = await repository.updateCompany(
          companyId: companyId, companyData: companyData);

      if (!result) images = <String>[];
    }
  }

  void activeOrOrderList(ActivesOrOrderByCompany result) {
    switch (result) {
      case ActivesOrOrderByCompany.actives:
        setListActive(true);
        break;
      case ActivesOrOrderByCompany.inactives:
        setListActive(false);
        break;
      case ActivesOrOrderByCompany.orderByAZ:
        setOrderByAz(true);
        break;
      case ActivesOrOrderByCompany.orderByZA:
        setOrderByAz(false);
        break;
    }
  }

  //COMPUTEDS
  @computed
  get companyList => repository.companies(listActive, orderByAz).value;
}
