import 'package:avatende/app/repositories//user/user_repository.dart';
import 'package:avatende/app/storesGlobal/app_store.dart';
import 'package:get_it/get_it.dart';
import 'package:avatende/app/helpers/extensions.dart';
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

  @observable
  bool resetPass = false;

  @observable
  bool isObscureText = true;

  //ACTIONS
  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setObscureText() => isObscureText = !isObscureText;

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

    repository.signIn(email: email, password: password).then((data) async {
      print(data.name);
      appStore.setUser(data);
      await appStore.getCompanyAndDepartment();
      loading = false;
      if (appStore.userViewModel.name != null) loggedIn = true;
    }).catchError((error) {
      loading = false;
      print("Error01: $error");
    });
  }

  @action
  Future<void> resetPassword() async {
    loading = true;

    //verificar se usuario existe no banco e enviar link de redefinição de senha
    await repository.resetPassword(email);

    loading = false;
    resetPass = true;
  }
}
