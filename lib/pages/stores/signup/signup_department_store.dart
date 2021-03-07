import 'package:avatende/models/department_model.dart';
import 'package:avatende/repositories/company/department/department_repository.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'signup_department_store.g.dart';

class SignupDepartmentStore = _SignupDepartmentStoreBase
    with _$SignupDepartmentStore;

abstract class _SignupDepartmentStoreBase with Store {
  //REPOSITÓRIO
  final repository = DepartmentRepository();

  //extensão do app
  final appStore = GetIt.I<AppStore>();

  //OBSERVABLES

  @observable
  String name;

  @observable
  String phone;

  @observable
  bool active = false;

  @observable
  bool loading = false;

  @observable
  bool signupSuccess = false;
  @observable
  bool orderByAz = true;

  @observable
  bool listActive = true;

  //ACTIONS
  @action
  void setName(String value) => name = value;

  @action
  void setPhone(String value) => phone = value;

  @action
  void setActive(bool value) => active = value;

  @action
  void setOrderByAz(bool value) => orderByAz = value;

  @action
  void setListActive(bool value) => listActive = value;
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
  bool get activeValid => active != null;

  @computed
  Function get signUpPressed =>
      (nameValid && phoneValid && activeValid && !loading) ? signUp : null;

  @action
  Future<void> signUp() async {
    loading = true;

    //Salvar a empresa no banco
    //e salvar no company model via appStore
    await repository
        .createDepartment(DepartmentModel(
      name: name,
      phone: phone,
      active: active,
    ))
        .then((data) {
      appStore.setDepartment(data);
      loading = false;
      if (data.active != null && data.name != null && data.phone != null)
        signupSuccess = true;
    }).catchError((error) {
      loading = false;
      print("Error01: $error");
    });
  }
}
