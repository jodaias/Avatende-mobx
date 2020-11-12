import 'package:avatende/models/department_model.dart';
import 'package:avatende/repositories/repository.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'signup_department_store.g.dart';

class SignupDepartmentStore = _SignupDepartmentStoreBase
    with _$SignupDepartmentStore;

abstract class _SignupDepartmentStoreBase with Store {
  //REPOSITÓRIO
  Repository repository = Repository();

  //extensão do app
  final appStore = GetIt.I<AppStore>();

  //OBSERVABLES

  @observable
  String name;

  @observable
  String phone;

  @observable
  String address;

  @observable
  bool active = false;

  @observable
  bool loading = false;

  @observable
  bool signupSuccess = false;

  @action
  void setName(String value) => name = value;

  @action
  void setPhone(String value) => phone = value;

  @action
  void setAddress(String value) => address = value;

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
        .signUpDepartment(DepartmentModel(
      name: name,
      address: address,
      phone: phone,
      active: active,
    ))
        .then((data) {
      appStore.setDepartment(data);
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
