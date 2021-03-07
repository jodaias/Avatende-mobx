import 'package:avatende/models/company_model.dart';
import 'package:avatende/repositories/company/company_repository.dart';
import 'package:mobx/mobx.dart';
part 'signup_company_store.g.dart';

class SignupCompanyStore = _SignupCompanyStoreBase with _$SignupCompanyStore;

abstract class _SignupCompanyStoreBase with Store {
  //REPOSITÓRIO
  final repository = CompanyRepository();

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
  void setSignupSuccess(bool value) => signupSuccess = value;

  @action
  void setAddress(String value) => address = value;

  //COMPUTEDS

  //Validando variaveis
  @computed
  bool get nameValid => name != null && name.length > 3;
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
  bool get activeValid => active != null;

  @computed
  Function get signUpPressed =>
      (nameValid && phoneValid && addressValid && activeValid && !loading)
          ? signUp
          : null;

  @action
  Future<void> signUp() async {
    loading = true;

    //Salvar a empresa no banco
    //e salvar no companyModel via appStore
    var result = await repository.createCompany(CompanyModel(
      name: name,
      address: address,
      phone: phone,
      active: active,
    ));
    print(result);
    if (result.contains('sucesso')) {
      setSignupSuccess(true);
      loading = false;
    } else {
      loading = false;
      setSignupSuccess(false);
    }
  }
}
