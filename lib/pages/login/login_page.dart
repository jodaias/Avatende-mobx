import 'package:avatende/pages/login/forget_password_page.dart';
import 'package:avatende/pages/root/root_page.dart';
import 'package:avatende/pages/stores/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginStore loginStore = LoginStore();

  ReactionDisposer disposer;

  void _showDialogUserInactive() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Usuário inativo'),
              content: Text(
                  'Infelizmente seu usuário está inativo :(. Favor entrar em contato com administrador'),
              actions: [
                FlatButton(
                  onPressed: Navigator.of(context).pop,
                  child: Text('Ok'),
                )
              ],
            ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction((_) => loginStore.loggedIn, (loggedIn) {
      if (loggedIn) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => RootPage()));
      } else {
        _showDialogUserInactive();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Entrar'),
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Acessar com E-mail:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 3, bottom: 4, top: 8),
                        child: Text(
                          'E-mail',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Observer(builder: (_) {
                        return TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              errorText: loginStore.emailError),
                          onChanged: loginStore.setEmail,
                          enabled: !loginStore.loading,
                          keyboardType: TextInputType.emailAddress,
                        );
                      }),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 3, bottom: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Senha',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            GestureDetector(
                              child: Text(
                                'Esqueceu sua senha?',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.purple,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => ForgetPasswordPage()));
                              },
                            )
                          ],
                        ),
                      ),
                      Observer(builder: (_) {
                        return TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            errorText: loginStore.passwordError,
                          ),
                          onChanged: loginStore.setPassword,
                          obscureText: true,
                          enabled: !loginStore.loading,
                        );
                      }),
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 12),
                        height: 40,
                        child: Observer(builder: (_) {
                          return RaisedButton(
                            color: Colors.orange,
                            child: loginStore.loading
                                ? CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                  )
                                : Text('ENTRAR'),
                            textColor: Colors.white,
                            disabledColor: Colors.grey[500],
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            onPressed: loginStore.loginPressed,
                          );
                        }),
                      ),
                      Divider(color: Colors.black),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Text(
                              'Não tenho uma conta:',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[700]),
                            ),
                            GestureDetector(
                              onTap: _showdialog,
                              child: Text(
                                'Cadastre_se',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.purple[600],
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  void _showdialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text(
              'Deseja abrir uma conta?',
              style: TextStyle(
                color: Colors.grey[900],
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              '1- Cadastrar conta de sua empresa, entre em contato: \n\n-> jodaias2013@gmail.com\n\n' +
                  '2- Abrir conta para atendente, entre em contato: \n\n-> Seu ADMINISTRADOR\n\n' +
                  '3- Empresa para teste:\n\n -> Email: empresa@empresa.com\n -> Senha: empresa@123\n\n' +
                  '4- Atendente para teste:\n\n -> Email: atendente@atendente.com \n -> Senha: atendente@123',
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w700,
              ),
            ),
            actions: <Widget>[
              RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'Ok',
                    style: TextStyle(
                      color: Colors.purple[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  })
            ],
          );
        });
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
