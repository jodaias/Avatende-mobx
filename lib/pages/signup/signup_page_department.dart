import 'package:avatende/pages/stores/signup_department_store.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:avatende/pages/signup/components/field_title.dart';
import 'package:brasil_fields/formatter/telefone_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class SignUpDepartmentPage extends StatefulWidget {
  @override
  _SignUpDepartmentPageState createState() => _SignUpDepartmentPageState();
}

class _SignUpDepartmentPageState extends State<SignUpDepartmentPage> {
  SignupDepartmentStore signupDepartmentStore = SignupDepartmentStore();
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    FieldTitle(
                      title: 'Nome',
                      subtitle: 'Digite o nome do departamento',
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Exemplo: Departamento01',
                          isDense: true,
                          errorText: signupDepartmentStore.nameError,
                        ),
                        onChanged: signupDepartmentStore.setName,
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
                          errorText: signupDepartmentStore.phoneError,
                        ),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter()
                        ],
                        onChanged: signupDepartmentStore.setPhone,
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
                          onPressed: signupDepartmentStore.formValid
                              ? () {
                                  Navigator.of(context).pop();
                                }
                              : null,
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
