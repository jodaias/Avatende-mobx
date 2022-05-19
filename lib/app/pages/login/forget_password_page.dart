import 'package:avatende/app/pages/root/root_page.dart';
import 'package:avatende/app/pages/stores/login/login_store.dart';
import 'package:avatende/app/pages/stores/notification/notification_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final loginStore = LoginStore();
  final notificationStore = GetIt.I<NotificationStore>();

  late ReactionDisposer disposer;

  _showDialogLinkSend() {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Redefinição de senha'),
        content: Text(
            'Você receberá um e-mail com instruções para redefinir sua senha em breve.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => RootPage()),
                  (route) => false);
            },
            child: Text('Voltar para o login!'),
          )
        ],
      ),
    );
  }

  _showDialogLinkNotSend() {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Link não enviado'),
        content:
            Text('Ocorreu um erro. Link não enviado para o email informado!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => RootPage()),
                  (route) => false);
            },
            child: Text('Ok'),
          )
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction((_) => loginStore.resetPass, (resetPass) {
      if (resetPass == true) {
        loginStore.resetPass = null;
        _showDialogLinkSend();
      } else if (resetPass == false) {
        notificationStore.showMessage(
          msg:
              "Erro na redefinição!\nVerifique se o email digitado faltou algum caractere, e tente novamente",
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        loginStore.resetPass = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Esqueceu a senha ?'),
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
                      'Por favor insira seu endereço de email:',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 12),
                      height: 40,
                      child: Observer(builder: (_) {
                        return ElevatedButton(
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
                          child: loginStore.loading
                              ? CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : Text('RESETAR SENHA'),
                          onPressed: loginStore.resetPasswordPressed,
                        );
                      }),
                    ),
                    Divider(color: Colors.black),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
