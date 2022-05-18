import 'package:avatende/app/repositories/avaliation/avaliation_repository.dart';
import 'package:avatende/app/storesGlobal/app_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:avatende/app/helpers/extensions.dart';

part 'avaliation_store.g.dart';

class AvaliationStore = _AvaliationStoreBase with _$AvaliationStore;

abstract class _AvaliationStoreBase with Store {
  var avaliationRepository = new AvaliationRepository();

  @observable
  double scores = 0;

  @observable
  String? observation;

  @observable
  String? email;

  @observable
  String? companyId;

  @observable
  bool loading = false;

  @observable
  bool? anonymous = true;

  @observable
  bool avaliationSuccess = false;

  @action
  void setScores(double value) => scores = value;

  @action
  void setObservation(String? value) => observation = value;

  @action
  void setEmail(String? value) => email = value;

  @action
  void setAnonymous(bool? value) => anonymous = value;

  @action
  void setCompanyId(String? value) => companyId = value;

  @computed
  bool get emailValid => email != null && email!.isEmailValid();
  String? get emailError {
    if (email == null || emailValid)
      return null;
    else if (email!.isEmpty)
      return 'Digite um email';
    else
      return 'Email inválido';
  }

  @computed
  VoidCallback? get sendPressed => !loading ? sendAvaliation : null;

  @action
  Future<void> sendAvaliation() async {
    final appStore = GetIt.I<AppStore>();
    loading = true;

    var result = await avaliationRepository.saveAvaliation(avaliationData: {
      'CreatedAt': DateTime.now(),
      'Scores': scores,
      'Observation': observation,
      'Email': email
    }, userViewModel: appStore.userViewModel!);

    loading = false;
    avaliationSuccess = true;
  }

  @computed
  get listAdsImages => avaliationRepository.adsImages(companyId ?? '').value;
}
