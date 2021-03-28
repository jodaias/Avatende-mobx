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
  bool active = true;

  @observable
  bool nivel = true;

  @observable
  String address;

  @observable
  String departmentId;

  @observable
  String companyId;

  @observable
  String userId;

  @observable
  bool signupSuccess;

  @observable
  bool isObscureText = true;
  @observable
  bool orderByAz = true;

  @observable
  bool listActive = true;

  @observable
  List<String> userTypes;

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
  void setAddress(String value) => address = value;

  @action
  void setPhone(String value) => phone = value;

  @action
  void setUserType(String value) => userType = value;

  @action
  void setActive(bool value) => active = value;

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
  void setDepartmentId(String value) => departmentId = value;

  @action
  void setCompanyId(String value) => companyId = value;

  @action
  void setUserId(String value) => userId = value;

  @action
  void setUserTypes(List<String> value) => userTypes = value;
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
  bool get userTypeValid =>
      userType != null && appStore.userViewModel.userType == "Master"
          ? (userType == "Admin" || userType == "Master")
          : (userType == "Admin" || userType == "Atendente");
  String get userTypeError {
    if (userType == null || userTypeValid)
      return null;
    else if (userType != 'Admin' ||
        userType != 'Atendente' ||
        userType != 'Master')
      return 'Campo obrigatório';
    else
      return 'Escolha um nível para continuar';
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
          addressValid &&
          userTypeValid &&
          !loading)
      ? signUp
      : null;

  @computed
  Function get updatePressed =>
      (nameValid && phoneValid && addressValid && userTypeValid && !loading)
          ? updateUser
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
          companyId: companyId,
          email: email,
          address: address,
          userType: userType,
        ),
        password: password1);

    loading = false;
    signupSuccess = true;
  }

  @action
  Future<void> updateUser() async {
    loading = true;

    var stringKey;
    var stringValue;

    if (userType == "Admin") {
      stringKey = 'CompanyId';
      stringValue = companyId;
    } else {
      stringKey = 'DepartmentId';
      stringValue = departmentId;
    }

    if (companyId == 'sYUwD44edugpkRL10Q56') {
      userType += '-Dev';
    }

    //Salvar a empresa no banco
    //e salvar no company model via appStore
    await repository.updateUser(
        userId: userId,
        userData: userType != "Master"
            ? {
                'Name': name,
                'Phone': phone,
                'Active': active,
                'UserType': userType,
                'Address': address,
                stringKey: stringValue,
                'UpdatedAt': DateTime.now()
              }
            : {
                'Name': name,
                'Phone': phone,
                'Active': active,
                'UserType': userType,
                'Address': address,
                'UpdatedAt': DateTime.now()
              });

    loading = false;
    signupSuccess = true;
  }
}
