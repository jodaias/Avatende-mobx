import 'package:avatende/models/views/user_view_model.dart';
import 'package:avatende/pages/root/root_page.dart';
import 'package:avatende/pages/stores/signup/signup_user_store.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:avatende/pages/signup/components/field_title.dart';
import 'package:brasil_fields/formatter/telefone_input_formatter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

final String url =
    'https://i.pinimg.com/236x/12/fa/d7/12fad712035c2df9aa0562d8a6c6afd9.jpg';

class SignUpUserPage extends StatefulWidget {
  const SignUpUserPage({
    Key key,
    this.isUpdate,
    this.departmentId,
    this.companyId,
    this.userViewModel,
    this.isPerfil,
  }) : super(key: key);

  final String departmentId;
  final String companyId;
  final UserViewModel userViewModel;
  final bool isUpdate;
  final bool isPerfil;

  @override
  _SignUpUserPageState createState() => _SignUpUserPageState();
}

class _SignUpUserPageState extends State<SignUpUserPage> {
  final signupUserStore = SignUpUserStore();
  final appStore = GetIt.I<AppStore>();

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction((_) => signupUserStore.signupSuccess, (signupSuccess) {
      if (signupSuccess) {
        Navigator.of(context).pop();
      } else {
        print('não foi possivel cadastrar');
      }
    });
  }

  void setAtributs() {
    signupUserStore.setCompanyId(widget.companyId);
    signupUserStore.setDepartmentId(widget.departmentId);

    if (widget.isUpdate) {
      signupUserStore.setName(widget.userViewModel.name);
      signupUserStore.setAddress(widget.userViewModel.address);
      signupUserStore.setActive(widget.userViewModel.active);
      signupUserStore.setPhone(widget.userViewModel.phone);

      if (appStore.userViewModel.userType == 'Master') {
        signupUserStore.setUserTypes(['Admin']);
        signupUserStore.setUserType(widget.userViewModel.userType);
      } else if (appStore.userViewModel.userType == 'Admin') {
        signupUserStore.setUserType("Admin");
        signupUserStore.setUserTypes(['Admin', 'Atendente']);
        if (widget.isPerfil) {
          signupUserStore.setUserTypes(['Admin']);
        }
      } else {
        signupUserStore.setUserType("Atendente");
        signupUserStore.setUserTypes(['Atendente']);
      }

      signupUserStore.setUserId(widget.userViewModel.userId());
    } else {
      if (appStore.userViewModel.userType == 'Master') {
        signupUserStore.setUserTypes(['Admin']);
      } else {
        signupUserStore.setUserTypes(['Admin', 'Atendente']);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    setAtributs();
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.isUpdate ? "Atualização" : "Cadastro"}'),
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
                      widget.isUpdate
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FieldTitle(
                                  title: 'Id',
                                  subtitle: '',
                                ),
                                Observer(builder: (_) {
                                  return TextFormField(
                                    initialValue: widget.userViewModel.userId(),
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        isDense: true,
                                        hoverColor: Colors.grey),
                                    enabled: false,
                                    readOnly: true,
                                  );
                                }),
                                SizedBox(
                                  height: 16,
                                ),
                              ],
                            )
                          : SizedBox(
                              height: 0,
                            ),
                      FieldTitle(
                        title: 'Nome',
                        subtitle: 'Digite o nome completo',
                      ),
                      Observer(builder: (_) {
                        return TextFormField(
                          initialValue:
                              widget.isUpdate ? widget.userViewModel.name : '',
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Exemplo: João Silva',
                            isDense: true,
                            errorText: signupUserStore.nameError,
                          ),
                          onChanged: signupUserStore.setName,
                        );
                      }),
                      SizedBox(
                        height: widget.isUpdate ? 8 : 16,
                      ),
                      !widget.isUpdate
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FieldTitle(
                                  title: 'Email',
                                  subtitle: 'Digite o email',
                                ),
                                Observer(builder: (_) {
                                  return TextFormField(
                                    initialValue: widget.isUpdate
                                        ? widget.userViewModel.email
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
                              height: 8,
                            ),
                      SizedBox(
                        height: widget.isUpdate ? 8 : 0,
                      ),
                      FieldTitle(
                        title: 'Endereço',
                        subtitle: 'Digite o endereço da empresa',
                      ),
                      Observer(builder: (_) {
                        return TextFormField(
                          initialValue: widget.isUpdate
                              ? widget.userViewModel.address
                              : '',
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Exemplo: Rua01, nº 09, Cidade-Estado',
                            isDense: true,
                            errorText: signupUserStore.addressError,
                          ),
                          onChanged: signupUserStore.setAddress,
                        );
                      }),
                      SizedBox(
                        height: 16,
                      ),
                      FieldTitle(
                        title: 'Telefone',
                        subtitle: 'Digite o número de telefone',
                      ),
                      Observer(builder: (_) {
                        return TextFormField(
                          initialValue:
                              widget.isUpdate ? widget.userViewModel.phone : '',
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '(99) 99999-9999',
                            isDense: true,
                            errorText: signupUserStore.phoneError,
                          ),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter()
                          ],
                          onChanged: signupUserStore.setPhone,
                        );
                      }),
                      SizedBox(
                        height: 16,
                      ),
                      FieldTitle(
                        title: 'Nível',
                        subtitle: widget.isPerfil
                            ? 'Seu nível de Acesso'
                            : 'Escolha o nível de acesso do usuário',
                      ),
                      Observer(builder: (_) {
                        return DropdownButton(
                          hint: Text('Selecione o nível'),
                          value: signupUserStore.userType,
                          onChanged: (newValue) {
                            signupUserStore.setUserType(newValue);
                          },
                          items: signupUserStore.userTypes.map((type) {
                            return DropdownMenuItem(
                              child: new Text(type),
                              value: type,
                            );
                          }).toList(),
                        );
                      }),
                      !widget.isUpdate
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 16,
                                ),
                                FieldTitle(
                                  title: 'Senha',
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
                                                  icon: Icon(Icons.visibility),
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
                                      onChanged: signupUserStore.setPassword1);
                                }),
                                SizedBox(
                                  height: 16,
                                ),
                                FieldTitle(
                                  title: 'Confirmar Senha',
                                  subtitle: 'Repita a senha',
                                ),
                                Observer(builder: (_) {
                                  return TextField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        isDense: true,
                                        suffixIcon: signupUserStore
                                                .isObscureText
                                            ? IconButton(
                                                icon: Icon(
                                                    Icons.visibility_outlined),
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
                                    obscureText: signupUserStore.isObscureText,
                                    onChanged: signupUserStore.setPassword2,
                                  );
                                }),
                              ],
                            )
                          : SizedBox(
                              height: 16,
                            ),
                      SizedBox(
                        height: widget.isUpdate ? 0 : 16,
                      ),
                      FieldTitle(
                        title: 'Ativa?',
                        subtitle:
                            'Escolha "sim" para ativo ou "não" para inativo!',
                      ),
                      Observer(builder: (_) {
                        return Row(
                          children: <Widget>[
                            Radio(
                              groupValue: signupUserStore.active,
                              value: true,
                              onChanged: (val) {
                                signupUserStore.setActive(val);
                              },
                            ),
                            Text('Sim'),
                            Radio(
                              groupValue: signupUserStore.active,
                              value: false,
                              onChanged: (val) {
                                signupUserStore.setActive(val);
                              },
                            ),
                            Text('Não'),
                          ],
                        );
                      }),
                      SizedBox(
                        height: 16,
                      ),

                      Observer(builder: (_) {
                        return Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 20, bottom: 12),
                          height: 40,
                          child: RaisedButton(
                            color: Colors.orange,
                            child: signupUserStore.loading
                                ? CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                  )
                                : Text(
                                    '${widget.isUpdate ? "ATUALIZAR" : "CADASTRAR"}'),
                            textColor: Colors.white,
                            elevation: 0,
                            disabledColor: Colors.grey[500],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            onPressed: widget.isUpdate
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
  }
}
