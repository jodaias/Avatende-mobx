import 'package:avatende/models/user_model.dart';
import 'package:avatende/repositories/company/department/user/user_repository.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:avatende/helpers/extensions.dart';

part 'signup_user_store.g.dart';

class SignUpUserStore = _SignUpUserStoreBase with _$SignUpUserStore;

abstract class _SignUpUserStoreBase with Store {
  //REPOSITÓRIO
  final repository = UserRepository();

  //extensão do app
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
  bool active = false;

  @observable
  String departmentId;

  @observable
  bool signupSuccess;

  @observable
  bool isObscureText = true;
  @observable
  bool orderByAz = true;

  @observable
  bool listActive = true;
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

  @action
  void setOrderByAz(bool value) => orderByAz = value;

  @action
  void setListActive(bool value) => listActive = value;

  @action
  void setDepartmentId(String value) => departmentId = value;

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
      userType != null && appStore.userViewModel.userType == "1"
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

  @computed
  Function get signUpPressed => (emailValid &&
          password1Valid &&
          password2Valid &&
          nameValid &&
          phoneValid &&
          userTypeValid &&
          !loading)
      ? signUp
      : null;

  @action
  Future<void> signUp() async {
    loading = true;

    //Salvar a empresa no banco
    //e salvar no company model via appStore
    await repository.signUpUser(
        usermodel: UserModel(
          name: name,
          phone: phone,
          active: active,
          departmentId: departmentId,
          email: email,
          userType: userType,
        ),
        password: password1);

    loading = false;
    signupSuccess = true;
  }
}
