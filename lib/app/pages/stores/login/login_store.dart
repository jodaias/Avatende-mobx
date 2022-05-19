import 'package:avatende/app/enums/user-type.dart';
import 'package:avatende/app/pages/stores/notification/notification_store.dart';
import 'package:avatende/app/repositories//user/user_repository.dart';
import 'package:avatende/app/storesGlobal/app_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:avatende/app/helpers/extensions.dart';
import 'package:mobx/mobx.dart';
// import 'package:firedart/firedart.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  //REPOSITÓRIO
  final repository = UserRepository();

  //extensões
  final notificationStore = GetIt.I<NotificationStore>();
  final appStore = GetIt.I<AppStore>();

  //OBSERVABLEs
  @observable
  String? email;

  @observable
  String? password;

  @observable
  bool loading = false;

  @observable
  bool? loggedIn = null;

  @observable
  bool? resetPass = null;

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
  bool get passwordValid => password != null && password!.length >= 6;
  String? get passwordError {
    if (password == null || passwordValid)
      return null;
    else if (password!.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Senha fraca';
  }

  @computed
  VoidCallback? get loginPressed =>
      (emailValid && passwordValid && !loading) ? login : null;

  @computed
  VoidCallback? get resetPasswordPressed =>
      (emailValid && !loading) ? resetPassword : null;

  @action
  Future<void> login() async {
    loading = true;

    //verificar se usuario existe no banco e salvar
    //no usuario modelo via appStore
    repository.signIn(email: email!, password: password!).then((data) async {
      appStore.setUser(data);
      if (data.name != null && data.userType != UserType.Master)
        await appStore.getCompanyAndDepartment();

      loading = false;
      if (appStore.userViewModel?.name != null) {
        loggedIn = true;
      } else {
        loggedIn = false;
      }
    }).catchError((error) {
      notificationStore.showMessage(
        msg:
            "Falha no login!\nUm erro ocorreu.\nSe persistir contacte o suporte.",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      loading = false;
    });

    // // LOGIN COM PACKAGE FIREDART

    // var auth = FirebaseAuth.instance;

    // await auth.signIn(email ?? "", password ?? "").catchError((e) {
    //   loading = false;
    //   loggedIn = false;
    // });

    // var user = await auth.getUser();
    // print(user);

    // // Instantiate a reference to a document - this happens offline
    // var ref =
    //     await Firestore.instance.collection('Users').document(user.id).get();

    // appStore.setUser(UserViewModel.fromMap(ref.map));

    // if (appStore.userViewModel!.name != null) loggedIn = true;

    // loading = false;
  }

  @action
  Future<void> resetPassword() async {
    loading = true;
    await repository.resetPassword(email!).then((_) {
      loading = false;
      resetPass = true;
    }).catchError((onError) {
      loading = false;
      resetPass = false;
    });
  }
}
