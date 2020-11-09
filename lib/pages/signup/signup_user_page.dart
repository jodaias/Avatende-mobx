import 'package:avatende/pages/stores/signup_user_store.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:avatende/pages/signup/components/field_title.dart';
import 'package:brasil_fields/formatter/telefone_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

final String url =
    'https://i.pinimg.com/236x/12/fa/d7/12fad712035c2df9aa0562d8a6c6afd9.jpg';

class SignUpUserPage extends StatefulWidget {
  @override
  _SignUpUserPageState createState() => _SignUpUserPageState();
}

class _SignUpUserPageState extends State<SignUpUserPage> {
  SignUpUserStore signupUserStore = SignUpUserStore();
  final appStore = GetIt.I<AppStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastro'),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
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
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover, image: NetworkImage(url))),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      FieldTitle(
                        title: 'Nome',
                        subtitle: 'Digite o nome completo',
                      ),
                      Observer(builder: (_) {
                        return TextField(
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
                        height: 16,
                      ),
                      FieldTitle(
                        title: 'Email',
                        subtitle: 'Digite seu email',
                      ),
                      Observer(builder: (_) {
                        return TextField(
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
                      FieldTitle(
                        title: 'Telefone',
                        subtitle: 'Digite o número de telefone',
                      ),
                      Observer(builder: (_) {
                        return TextField(
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
                        subtitle: 'Digite o nível do usuário',
                      ),
                      Observer(builder: (_) {
                        return TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: appStore.userModel.userType == "1"
                                ? '1=Gestor/2=Admin/3=Atendente'
                                : '2=Admin/3=Atendente',
                            isDense: true,
                            errorText: signupUserStore.userTypeError,
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: signupUserStore.setUserType,
                        );
                      }),
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
                                errorText: signupUserStore.password1Error),
                            obscureText: true,
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
                              errorText: signupUserStore.password2Error),
                          obscureText: true,
                          onChanged: signupUserStore.setPassword2,
                        );
                      }),
                      SizedBox(
                        height: 16,
                      ),
                      Observer(builder: (_) {
                        return Container(
                          margin: EdgeInsets.only(top: 20, bottom: 12),
                          height: 40,
                          child: RaisedButton(
                            color: Colors.orange,
                            child: Text('CADASTRAR'),
                            textColor: Colors.white,
                            elevation: 0,
                            disabledColor: Colors.grey[500],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            onPressed: signupUserStore.formValid
                                ? () {
                                    Navigator.of(context).pop();
                                  }
                                : null,
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
