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
  final _repository = new CompanyRepository();

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
  String companyId;

  @observable
  File imageFile;

  @observable
  bool saveImagesSuccess = false;

  //ACTIONS
  @action
  void setCompanyId(String value) => companyId = value;

  @action
  void setImageFile(File value) => imageFile = value;

  @action
  void setImages(List<String> value) => images = value;

  @action
  void setOrderByAz(bool value) => orderByAz = value;

  @action
  void setSaveImagesSuccess(bool value) => saveImagesSuccess = value;

  @action
  void setListActive(bool value) => listActive = value;

  @action
  Future<void> saveImages() async {
    var companyData = {"Images": images};

    var result = await _repository.addImagesCompany(
        companyId: companyId, companyData: companyData);

    setSaveImagesSuccess(false);

    if (result) setSaveImagesSuccess(true);

    loading = false;
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

  @action
  Future<void> updateCompany(
      String companyId, Map<String, dynamic> companyData) async {
    await _repository.updateCompany(
        companyData: companyData, companyId: companyId);
  }

  //COMPUTEDS
  @computed
  get companyList => _repository.companies(listActive, orderByAz).value;
}
