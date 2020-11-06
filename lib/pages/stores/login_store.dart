import 'package:avatende/storesGlobal/app_store.dart';
import 'package:get_it/get_it.dart';
import 'package:avatende/models/user_model.dart';
import 'package:avatende/helpers/extensions.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final appStore = GetIt.I<AppStore>();

  //OBSERVABLEs
  @observable
  String email;

  @observable
  String password;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  //ACTIONS
  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  //COMPUTEDs
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
  bool get passwordValid => password != null && password.isPasswordValid();
  String get passwordError {
    if (password == null || passwordValid)
      return null;
    else if (password.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Senha fraca';
  }

  @computed
  Function get loginPressed =>
      (emailValid && passwordValid && !loading) ? login : null;

  @action
  Future<void> login() async {
    loading = true;

    //verificar se usuario existe no banco e salvar
    //no usuario modelo via appStore
    await Future.delayed(Duration(seconds: 2));

    appStore.setUser(UserModel(
      email: email,
      name: 'Jodaías Barreto',
      password: password,
      userType: "1",
      active: false,
    ));

    loading = false;
    loggedIn = true;
  }
}
