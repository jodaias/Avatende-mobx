import 'package:mobx/mobx.dart';
part 'signup_department_store.g.dart';

class SignupDepartmentStore = _SignupDepartmentStoreBase
    with _$SignupDepartmentStore;

abstract class _SignupDepartmentStoreBase with Store {
  //OBSERVABLES

  @observable
  String name;

  @observable
  String phone;

  @action
  void setName(String value) => name = value;

  @action
  void setPhone(String value) => phone = value;

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
  bool get formValid => nameValid && phoneValid;
}
