import 'package:avatende/app/repositories/avaliation/avaliation_repository.dart';
import 'package:avatende/app/storesGlobal/app_store.dart';
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
  String observation;

  @observable
  String email;

  @observable
  String phone;

  @observable
  String companyId;

  @observable
  bool loading = false;

  @observable
  bool anonymous = true;

  @observable
  bool avaliationSuccess = false;

  @action
  void setScores(double value) => scores = value;

  @action
  void setObservation(String value) => observation = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPhone(String value) => phone = value;

  @action
  void setAnonymous(bool value) => anonymous = value;

  @action
  void setCompanyId(String value) => companyId = value;

//Validando variaveis
  // @computed
  // bool get observationValid => observation != null && observation.length > 3;
  // String get observationError {
  //   if (observation == null || observationValid)
  //     return null;
  //   else if (observation.isEmpty)
  //     return 'Digite uma observação';
  //   else
  //     return 'Observação muito curta';
  // }

  @computed
  bool get emailValid => email != null && email.isEmailValid();
  String get emailError {
    if (email == null || emailValid)
      return null;
    else if (email.isEmpty)
      return 'Digite um email';
    else
      return 'Email inválido';
  }

  @computed
  bool get phoneValid => phone != null && phone.length >= 14;
  String get phoneError {
    if (phone == null || phoneValid)
      return null;
    else if (phone.isEmpty)
      return 'Digite um número';
    else
      return 'Número inválido';
  }

  @computed
  Function get sendPressed =>
      (/*observationValid && emailValid &&*/ !loading) ? sendAvaliation : null;

  @action
  Future<void> sendAvaliation() async {
    final appStore = GetIt.I<AppStore>();
    loading = true;

    //Salvar a avaliação no banco
    Future.delayed(Duration(seconds: 2));

    print('scores: $scores');
    var result = await avaliationRepository.saveAvaliation(avaliationData: {
      'CreatedAt': DateTime.now(),
      'Scores': scores,
      'Observation': observation,
      'Contato': phone,
      'Email': email
    }, userViewModel: appStore.userViewModel);

    print('result cadastro: $result');

    loading = false;
    avaliationSuccess = true;
  }

  @computed
  get listAdsImages => avaliationRepository.adsImages(companyId).value;
}
