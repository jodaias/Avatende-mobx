import 'package:avatende/app/enums/user-type.dart';
import 'package:avatende/app/models/views/user_view_model.dart';
import 'package:avatende/app/pages/stores/signup/signup_user_store.dart';
import 'package:avatende/app/storesGlobal/app_store.dart';
import 'package:avatende/app/pages/signup/components/field_title.dart';
// import 'package:brasil_fields/formatter/telefone_input_formatter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class SignUpUserPage extends StatefulWidget {
  const SignUpUserPage({
    Key? key,
    this.isUpdate,
    this.departmentId,
    this.companyId,
    this.userViewModel,
    this.isPerfil,
  }) : super(key: key);

  final String? departmentId;
  final String? companyId;
  final UserViewModel? userViewModel;
  final bool? isUpdate;
  final bool? isPerfil;

  @override
  _SignUpUserPageState createState() => _SignUpUserPageState();
}

class _SignUpUserPageState extends State<SignUpUserPage> {
  final signupUserStore = SignUpUserStore();
  final appStore = GetIt.I<AppStore>();

  late ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction((_) => signupUserStore.signupSuccess, (signupSuccess) {
      if (signupSuccess == true) {
        appStore.getUser();
        Navigator.of(context).pop();
      } else {
        print('não foi possivel cadastrar');
      }
    });
  }

  void setAtributs() {
    signupUserStore.setCompanyId(widget.companyId ?? "");
    signupUserStore.setDepartmentId(widget.departmentId ?? "");

    if (widget.isUpdate!) {
      signupUserStore.setName(widget.userViewModel!.name ?? "");
      signupUserStore.setActive(widget.userViewModel!.active);
      signupUserStore.setUserId(widget.userViewModel!.userId() ?? "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      setAtributs();
      return Scaffold(
          appBar: AppBar(
            title: Text('${widget.isUpdate! ? "Atualização" : "Cadastro"}'),
            centerTitle: true,
          ),
          body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 32),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 8,
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FieldTitle(
                          title: 'Nome ',
                          subtitle: 'Digite o nome completo',
                        ),
                        Observer(builder: (_) {
                          return TextFormField(
                            initialValue: widget.isUpdate!
                                ? widget.userViewModel!.name
                                : '',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Exemplo: João Silva',
                              isDense: true,
                              errorText: signupUserStore.nameError,
                            ),
                            onChanged: signupUserStore.setName,
                          );
                        }),
                        !widget.isUpdate!
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 16,
                                  ),
                                  FieldTitle(
                                    title: 'Email ',
                                    subtitle: 'Digite o email',
                                  ),
                                  Observer(builder: (_) {
                                    return TextFormField(
                                      initialValue: widget.isUpdate!
                                          ? widget.userViewModel!.email
                                          : '',
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        errorText: signupUserStore.emailError,
                                        hintText: 'Exemplo: joão@gmail.com',
                                        isDense: true,
                                      ),
                                      onChanged: signupUserStore.setEmail,
                                      keyboardType: TextInputType.emailAddress,
                                      autocorrect: false,
                                    );
                                  }),
                                  SizedBox(
                                    height: 16,
                                  ),
                                ],
                              )
                            : SizedBox(
                                height: 16,
                              ),
                        !widget.isUpdate!
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 16,
                                  ),
                                  FieldTitle(
                                    title: 'Senha ',
                                    subtitle:
                                        'Use letras, números, caracteres especiais. Mínimo: 6 caracteres',
                                  ),
                                  Observer(builder: (_) {
                                    return TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            isDense: true,
                                            suffixIcon: signupUserStore
                                                    .isObscureText
                                                ? IconButton(
                                                    icon:
                                                        Icon(Icons.visibility),
                                                    onPressed: signupUserStore
                                                        .setObscureText,
                                                  )
                                                : IconButton(
                                                    icon: Icon(Icons
                                                        .visibility_off_outlined),
                                                    onPressed: signupUserStore
                                                        .setObscureText,
                                                  ),
                                            errorText:
                                                signupUserStore.password1Error),
                                        obscureText:
                                            signupUserStore.isObscureText,
                                        onChanged:
                                            signupUserStore.setPassword1);
                                  }),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  FieldTitle(
                                    title: 'Confirmar Senha ',
                                    subtitle: 'Repita a senha',
                                  ),
                                  Observer(builder: (_) {
                                    return TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true,
                                          suffixIcon:
                                              signupUserStore.isObscureText
                                                  ? IconButton(
                                                      icon: Icon(Icons
                                                          .visibility_outlined),
                                                      onPressed: signupUserStore
                                                          .setObscureText,
                                                    )
                                                  : IconButton(
                                                      icon: Icon(Icons
                                                          .visibility_off_outlined),
                                                      onPressed: signupUserStore
                                                          .setObscureText,
                                                    ),
                                          errorText:
                                              signupUserStore.password2Error),
                                      obscureText:
                                          signupUserStore.isObscureText,
                                      onChanged: signupUserStore.setPassword2,
                                    );
                                  }),
                                ],
                              )
                            : SizedBox(
                                height: 16,
                              ),
                        SizedBox(
                          height: widget.isUpdate! ? 0 : 16,
                        ),
                        !widget.isPerfil!
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 16,
                                  ),
                                  FieldTitle(
                                    title: 'Ativo? ',
                                    subtitle:
                                        'Escolha "sim" para ativo ou "não" para inativo!',
                                  ),
                                  Observer(builder: (_) {
                                    return Row(
                                      children: <Widget>[
                                        Radio(
                                          groupValue: signupUserStore.active,
                                          value: true,
                                          onChanged: signupUserStore.setActive,
                                        ),
                                        Text('Sim'),
                                        Radio(
                                          groupValue: signupUserStore.active,
                                          value: false,
                                          onChanged: signupUserStore.setActive,
                                        ),
                                        Text('Não'),
                                      ],
                                    );
                                  }),
                                  SizedBox(
                                    height: 16,
                                  ),
                                ],
                              )
                            : SizedBox(
                                height: 16,
                              ),

                        Observer(builder: (_) {
                          return Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 20, bottom: 12),
                            height: 40,
                            child: ElevatedButton(
                              child: signupUserStore.loading
                                  ? CircularProgressIndicator(
                                      valueColor:
                                          AlwaysStoppedAnimation(Colors.white),
                                    )
                                  : Text(
                                      '${widget.isUpdate! ? "ATUALIZAR" : "CADASTRAR"}'),
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.orange),
                                textStyle: MaterialStateProperty.all(
                                  TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onPressed: widget.isUpdate!
                                  ? signupUserStore.updatePressed
                                  : signupUserStore.signUpPressed,
                            ),
                          );
                        }),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(vertical: 8),
                        //   child: Wrap(
                        //     alignment: WrapAlignment.center,
                        //     children: [
                        //       Text(
                        //         'Já tenho uma conta:',
                        //         style: TextStyle(
                        //           fontSize: 16,
                        //         ),
                        //       ),
                        //       GestureDetector(
                        //         onTap: Navigator.of(context).pop,
                        //         child: Text(
                        //           'Entrar',
                        //           style: TextStyle(
                        //             decoration: TextDecoration.underline,
                        //             color: Colors.purple,
                        //             fontSize: 16,
                        //           ),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ));
    });
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
