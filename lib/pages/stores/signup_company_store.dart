import 'package:avatende/models/company_model.dart';
import 'package:avatende/repositories/interfaces/IRepository.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'signup_company_store.g.dart';

class SignupCompanyStore = _SignupCompanyStoreBase with _$SignupCompanyStore;

abstract class _SignupCompanyStoreBase with Store {
  //REPOSITÓRIO
  IRepository repository;

  //extensão do app
  final appStore = GetIt.I<AppStore>();

  //OBSERVABLES
  @observable
  String name;

  @observable
  String address;

  @observable
  String phone;

  @observable
  bool active = false;

  @observable
  bool loading = false;

  @observable
  bool signupSuccess = false;

  //ACTIONS
  @action
  void setName(String value) => name = value;

  @action
  void setPhone(String value) => phone = value;

  @action
  void setActive(bool value) => active = value;

  @action
  setAddress(String value) => address = value;

  //COMPUTEDS

  //Validando variaveis
  @computed
  bool get nameValid => name != null && name.length > 6;
  String get nameError {
    if (name == null || nameValid)
      return null;
    else if (name.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Nome muito curto';
  }

  @computed
  bool get phoneValid => phone != null && phone.length >= 14;
  String get phoneError {
    if (phone == null || phoneValid)
      return null;
    else if (phone.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Número inválido';
  }

  @computed
  bool get addressValid => address != null && address.length > 6;
  String get addressError {
    if (address == null || addressValid)
      return null;
    else if (address.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Endereço muito curto';
  }

  @computed
  Function get signUpPressed =>
      (nameValid && phoneValid && addressValid && !loading) ? signUp : null;

  @action
  Future<void> signUp() async {
    loading = true;

    //Salvar a empresa no banco
    //e salvar no company model via appStore
    await repository
        .signUpCompany(CompanyModel(
      name: name,
      address: address,
      phone: phone,
      active: active,
    ))
        .then((data) {
      appStore.setCompany(data);
      loading = false;
      if (data.active != null &&
          data.address != null &&
          data.name != null &&
          data.phone != null) signupSuccess = true;
    }).catchError((error) {
      loading = false;
      print("Error01: $error");
    });
  }
}
