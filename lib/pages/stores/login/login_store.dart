import 'package:avatende/repositories/company/department/user/user_repository.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:get_it/get_it.dart';
import 'package:avatende/models/user_model.dart';
import 'package:avatende/helpers/extensions.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  //REPOSITÓRIO
  final repository = UserRepository();

  //extensão do app
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
  bool get passwordValid => password != null && password.length >= 6;
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

  @computed
  Function get resetPasswordPressed =>
      (emailValid && !loading) ? resetPassword : null;

  @action
  Future<void> login() async {
    loading = true;

    //verificar se usuario existe no banco e salvar
    //no usuario modelo via appStore

    await repository.signIn(email: email, password: password).then((data) {
      print(data);
      appStore.setUser(data);
      loading = false;
      if (data != null) loggedIn = true;
    }).catchError((error) {
      loading = false;
      print("Error01: $error");
    });
  }

  @action
  Future<void> resetPassword() async {
    loading = true;

    //verificar se usuario existe no banco e enviar link de redefinição de senha
    print('Foi enviado um link para o email informado!');
    await Future.delayed(Duration(seconds: 2));

    loading = false;
    loggedIn = true;
  }
}
