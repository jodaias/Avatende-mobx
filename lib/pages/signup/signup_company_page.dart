import 'package:avatende/pages/stores/signup_company_store.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:avatende/pages/signup/components/field_title.dart';
import 'package:brasil_fields/formatter/telefone_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class SignUpCompanyPage extends StatefulWidget {
  @override
  _SignUpCompanyPageState createState() => _SignUpCompanyPageState();
}

class _SignUpCompanyPageState extends State<SignUpCompanyPage> {
  SignupCompanyStore signupCompanyStore = SignupCompanyStore();

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer =
        reaction((_) => signupCompanyStore.signupSuccess, (signupSuccess) {
      if (signupSuccess) {
        Navigator.of(context).pop();
      } else {
        print('não foi possivel cadastrar');
      }
    });
  }

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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      FieldTitle(
                        title: 'Nome',
                        subtitle: 'Digite o nome da empresa',
                      ),
                      Observer(builder: (_) {
                        return TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Exemplo: Empresa01',
                            isDense: true,
                            errorText: signupCompanyStore.nameError,
                          ),
                          onChanged: signupCompanyStore.setName,
                        );
                      }),
                      SizedBox(
                        height: 16,
                      ),
                      FieldTitle(
                        title: 'Endereço',
                        subtitle: 'Digite o endereço da empresa',
                      ),
                      Observer(builder: (_) {
                        return TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText:
                                'Exemplo: Rua01, centro, nº 09, Jacobina Ba',
                            isDense: true,
                            errorText: signupCompanyStore.addressError,
                          ),
                          onChanged: signupCompanyStore.setAddress,
                        );
                      }),
                      SizedBox(
                        height: 16,
                      ),
                      FieldTitle(
                        title: 'Telefone',
                        subtitle: 'Digite número de telefone',
                      ),
                      Observer(builder: (_) {
                        return TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '(99) 99999-9999',
                            isDense: true,
                            errorText: signupCompanyStore.phoneError,
                          ),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter()
                          ],
                          onChanged: signupCompanyStore.setPhone,
                        );
                      }),
                      SizedBox(
                        height: 16,
                      ),
                      FieldTitle(
                        title: 'Ativa?',
                        subtitle:
                            'Escolha "sim" para ativa ou "não" para inativa',
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Observer(builder: (_) {
                        return Container(
                          margin: EdgeInsets.only(top: 20, bottom: 12),
                          height: 40,
                          child: RaisedButton(
                            color: Colors.orange,
                            child: signupCompanyStore.loading
                                ? CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                  )
                                : Text('CADASTRAR'),
                            textColor: Colors.white,
                            elevation: 0,
                            disabledColor: Colors.grey[500],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            onPressed: signupCompanyStore.signUpPressed,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
