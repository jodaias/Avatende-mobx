import 'package:avatende/storesGlobal/app_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:avatende/helpers/extensions.dart';

part 'signup_user_store.g.dart';

class SignUpUserStore = _SignUpUserStoreBase with _$SignUpUserStore;

abstract class _SignUpUserStoreBase with Store {
  final appStore = GetIt.I<AppStore>();
  //OBSERVABLES

  @observable
  bool loading = false;

  @observable
  String phone;

  @observable
  String userType;

  @observable
  String password1;

  @observable
  String password2;

  @observable
  String name;

  @observable
  String email;

  @observable
  bool isObscureText = true;

  //ACTIONS
  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword1(String value) => password1 = value;

  @action
  void setPassword2(String value) => password2 = value;

  @action
  void setName(String value) => name = value;

  @action
  void setPhone(String value) => phone = value;

  @action
  void setUserType(String value) => userType = value;

  @action
  void setObscureText() => isObscureText = !isObscureText;

  @action
  void setLoading(value) => loading = value;

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
  bool get emailValid => email != null && email.isEmailValid();
  String get emailError {
    if (email == null || emailValid)
      return null;
    else if (email.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Email inválido';
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
  bool get userTypeValid =>
      userType != null && appStore.userModel.userType == "1"
          ? (userType == "1" || userType == "2" || userType == "3")
          : (userType == "2" || userType == "3");
  String get userTypeError {
    if (userType == null || userTypeValid)
      return null;
    else if (userType.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Tipo inválido';
  }

  @computed
  bool get password1Valid => password1 != null && password1.isPasswordValid();
  String get password1Error {
    if (password1 == null || password1Valid)
      return null;
    else if (password1.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Senha fraca';
  }

  @computed
  bool get password2Valid => password2 != null && password2 == password1;
  String get password2Error {
    if (password2 == null || password2Valid)
      return null;
    else
      return 'Senhas não coincidem';
  }

  //Validando os formulários do Cadastro
  @computed
  bool get formValid =>
      emailValid &&
      password1Valid &&
      password2Valid &&
      nameValid &&
      phoneValid &&
      userTypeValid;

  //verificando se está carregando
  @computed
  bool get isLoading => loading != false;
}
