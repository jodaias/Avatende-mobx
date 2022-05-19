import 'package:avatende/app/models/company_model.dart';
import 'package:avatende/app/models/views/company_view_model.dart';
import 'package:avatende/app/repositories/company/company_repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'signup_company_store.g.dart';

class SignupCompanyStore = _SignupCompanyStoreBase with _$SignupCompanyStore;

abstract class _SignupCompanyStoreBase with Store {
  //REPOSITÓRIO
  final repository = CompanyRepository();

  //OBSERVABLES
  @observable
  String? companyId;

  @observable
  String? name;

  @observable
  String? address;

  @observable
  String? phone;

  @observable
  bool? active = false;

  @observable
  bool loading = false;

  @observable
  bool? signupSuccess = null;

  //ACTIONS
  @action
  void setCompanyId(String? value) => companyId = value;

  @action
  void setName(String? value) => name = value;

  @action
  void setPhone(String? value) => phone = value;

  @action
  void setActive(bool? value) => active = value;

  @action
  void setSignupSuccess(bool? value) => signupSuccess = value;

  @action
  void setAddress(String? value) => address = value;

  //COMPUTEDS

  //Validando variaveis
  @computed
  bool get nameValid => name != null && name!.length > 3;
  String? get nameError {
    if (name == null || nameValid)
      return null;
    else if (name!.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Nome muito curto';
  }

  @computed
  bool get phoneValid => phone != null && phone!.length >= 14;
  String? get phoneError {
    if (phone == null || phoneValid)
      return null;
    else if (phone!.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Número inválido';
  }

  @computed
  bool get addressValid => address != null && address!.length > 6;
  String? get addressError {
    if (address == null || addressValid)
      return null;
    else if (address!.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Endereço muito curto';
  }

  @computed
  bool get activeValid => active != null;

  @computed
  VoidCallback? get signUpPressed =>
      (nameValid && phoneValid && addressValid && activeValid && !loading)
          ? signUp
          : null;

  @computed
  VoidCallback? get updatePressed =>
      (nameValid && phoneValid && addressValid && activeValid && !loading)
          ? updateCompany
          : null;

  @action
  Future<void> signUp() async {
    loading = true;

    //Salvar a empresa no banco
    //e salvar no companyModel via appStore
    var result = await repository.createCompany(CompanyModel(
      name: name!,
      address: address!,
      phone: phone!,
      active: active!,
    ));
    if (result.contains('sucesso')) {
      signupSuccess = true;
      loading = false;
    } else {
      loading = false;
      signupSuccess = false;
    }
  }

  @action
  Future<void> updateCompany() async {
    loading = true;
    var companyViewModel = new CompanyViewModel(
        name: name!, address: address!, phone: phone!, active: active!);
    var companyData = CompanyModel.mapperFromCompanyViewModel(companyViewModel);

    var result = await repository.updateCompany(
        companyData: companyData.toMap(), companyId: companyId!);
    if (result) {
      signupSuccess = true;
      loading = false;
    } else {
      loading = false;
      signupSuccess = false;
    }
  }
}
