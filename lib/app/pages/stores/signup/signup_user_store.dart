import 'package:avatende/app/enums/user-type.dart';
import 'package:avatende/app/models/user_model.dart';
import 'package:avatende/app/repositories/user/user_repository.dart';
import 'package:avatende/app/storesGlobal/app_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:avatende/app/helpers/extensions.dart';

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
  UserType? userType;

  @observable
  String? password1;

  @observable
  String? password2;

  @observable
  String? name;

  @observable
  String? email;

  @observable
  bool? active = false;

  @observable
  bool nivel = true;

  @observable
  String? departmentId;

  @observable
  String? companyId;

  @observable
  String? userId;

  @observable
  bool? signupSuccess;

  @observable
  bool isObscureText = true;
  @observable
  bool orderByAz = true;

  @observable
  bool listActive = true;

  @observable
  List<UserType> userTypes = <UserType>[];

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
  void setUserType(UserType value) => userType = value;

  @action
  void setActive(bool? value) => active = value;

  @action
  void setNivel(bool value) => nivel = value;

  @action
  void setObscureText() => isObscureText = !isObscureText;

  @action
  void setLoading(value) => loading = value;

  @action
  void setOrderByAz(bool value) => orderByAz = value;

  @action
  void setListActive(bool value) => listActive = value;

  @action
  void setDepartmentId(String? value) => departmentId = value;

  @action
  void setCompanyId(String? value) => companyId = value;

  @action
  void setUserId(String? value) => userId = value;

  @action
  void setUserTypes(List<UserType> value) => userTypes = value;
  //COMPUTEDS

  //Validando variaveis
  @computed
  bool get nameValid => name != null && name!.length > 2;
  String? get nameError {
    if (name == null || nameValid)
      return null;
    else if (name!.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Nome muito curto';
  }

  @computed
  bool get emailValid => email != null && email!.isEmailValid();
  String? get emailError {
    if (email == null || emailValid)
      return null;
    else if (email!.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Email inválido';
  }

  @computed
  bool get activeValid => active != null;

  @computed
  bool get userTypeValid =>
      userType != null && appStore.userViewModel!.userType == UserType.Master
          ? (userType == UserType.Admin || userType == UserType.Master)
          : (userType == UserType.Admin || userType == UserType.User);
  String? get userTypeError {
    if (userType == null || userTypeValid)
      return null;
    else if (userType != UserType.Admin ||
        userType != UserType.User ||
        userType != UserType.Master)
      return 'Campo obrigatório';
    else
      return 'Escolha um nível para continuar';
  }

  @computed
  bool get password1Valid => password1 != null && password1!.isPasswordValid();
  String? get password1Error {
    if (password1 == null || password1Valid)
      return null;
    else if (password1!.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Senha fraca';
  }

  @computed
  bool get password2Valid => password2 != null && password2 == password1;
  String? get password2Error {
    if (password2 == null || password2Valid)
      return null;
    else
      return 'Senhas não coincidem';
  }

  @computed
  VoidCallback? get signUpPressed => (emailValid &&
          password1Valid &&
          password2Valid &&
          nameValid &&
          activeValid &&
          !loading)
      ? signUp
      : null;

  @computed
  VoidCallback? get updatePressed =>
      (nameValid && activeValid && !loading) ? updateUser : null;

  @action
  Future<void> signUp() async {
    loading = true;

    //Salvar a empresa no banco
    //e salvar no company model via appStore
    _setUserType();

    repository
        .signUpUser(
            usermodel: UserModel(
              name: name!,
              active: active!,
              departmentId: departmentId,
              companyId: companyId,
              email: email!,
              userType: userType!,
            ),
            password: password1!)
        .then((value) {
      loading = false;
      signupSuccess = true;
    });
  }

  _setUserType() {
    switch (appStore.userViewModel!.userType) {
      case UserType.Master:
        userType = UserType.Admin;
        break;
      default:
        userType = UserType.User;
        break;
    }
  }

  @action
  Future<void> updateUser() async {
    loading = true;

    //Salvar a empresa no banco
    //e salvar no company model via appStore
    await repository.updateUser(userId: userId!, userData: {
      'Name': name,
      'Active': active,
      'UpdatedAt': DateTime.now()
    });

    loading = false;
    signupSuccess = true;
  }
}
