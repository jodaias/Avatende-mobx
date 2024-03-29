import 'package:avatende/app/pages/stores/signup/signup_department_store.dart';
import 'package:avatende/app/pages/signup/components/field_title.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class SignUpDepartmentPage extends StatefulWidget {
  const SignUpDepartmentPage({Key? key, this.companyId}) : super(key: key);

  final String? companyId;

  @override
  _SignUpDepartmentPageState createState() => _SignUpDepartmentPageState();
}

class _SignUpDepartmentPageState extends State<SignUpDepartmentPage> {
  SignupDepartmentStore signupDepartmentStore = SignupDepartmentStore();

  late ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer =
        reaction((_) => signupDepartmentStore.signupSuccess, (signupSuccess) {
      if (signupSuccess == true) {
        Navigator.of(context).pop();
      } else {
        print('não foi possivel cadastrar');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    signupDepartmentStore.setCompanyId(widget.companyId!);
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
                    FieldTitle(
                      title: 'Ativa?',
                      subtitle:
                          'Escolha "sim" para ativo ou "não" para inativo!',
                    ),
                    Observer(builder: (_) {
                      return Row(
                        children: <Widget>[
                          Radio(
                            groupValue: signupDepartmentStore.active,
                            value: true,
                            onChanged: signupDepartmentStore.setActive,
                          ),
                          Text('Sim'),
                          Radio(
                            groupValue: signupDepartmentStore.active,
                            value: false,
                            onChanged: signupDepartmentStore.setActive,
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
                        child: ElevatedButton(
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
                          child: signupDepartmentStore.loading
                              ? CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : Text('CADASTRAR'),
                          onPressed: signupDepartmentStore.signUpPressed,
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

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
