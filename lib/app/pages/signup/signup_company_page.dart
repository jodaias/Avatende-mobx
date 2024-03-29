import 'package:avatende/app/models/views/company_view_model.dart';
import 'package:avatende/app/pages/stores/notification/notification_store.dart';
import 'package:avatende/app/pages/stores/signup/signup_company_store.dart';
import 'package:avatende/app/pages/signup/components/field_title.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class SignUpCompanyPage extends StatefulWidget {
  const SignUpCompanyPage({this.isUpdate = false, this.companyViewModel});
  final bool isUpdate;
  final CompanyViewModel? companyViewModel;

  @override
  _SignUpCompanyPageState createState() => _SignUpCompanyPageState();
}

class _SignUpCompanyPageState extends State<SignUpCompanyPage> {
  final signupCompanyStore = SignupCompanyStore();
  final notificationStore = GetIt.I<NotificationStore>();

  late ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer =
        reaction((_) => signupCompanyStore.signupSuccess, (signupSuccess) {
      if (signupSuccess == true) {
        signupCompanyStore.setSignupSuccess(null);
        notificationStore.showMessage(
            backgroundColor: Colors.green,
            textColor: Colors.white,
            gravity: ToastGravity.SNACKBAR);
        Navigator.of(context).pop(true);
      } else if (signupSuccess == false) {
        signupCompanyStore.setSignupSuccess(null);
        notificationStore.showMessage(
            backgroundColor: Colors.red,
            textColor: Colors.white,
            gravity: ToastGravity.SNACKBAR);
      }
    });
  }

  void setAtributsIfUpdate() {
    signupCompanyStore.setCompanyId(widget.companyViewModel?.companyId());
    signupCompanyStore.setName(widget.companyViewModel?.name);
    signupCompanyStore.setAddress(widget.companyViewModel?.address);
    signupCompanyStore.setActive(widget.companyViewModel?.active);
    signupCompanyStore.setPhone(widget.companyViewModel?.phone);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (widget.isUpdate) setAtributsIfUpdate();
      return Scaffold(
          appBar: AppBar(
            title: Text(widget.isUpdate ? "Cadastro" : "Atualização"),
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
                          return TextFormField(
                            initialValue: widget.isUpdate
                                ? widget.companyViewModel?.name
                                : '',
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
                          return TextFormField(
                            initialValue: widget.isUpdate
                                ? widget.companyViewModel?.address
                                : '',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Exemplo: Rua01, nº 09, Cidade-Estado',
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
                          return TextFormField(
                            initialValue: widget.isUpdate
                                ? widget.companyViewModel?.phone
                                : '',
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
                        Observer(builder: (_) {
                          return Row(
                            children: <Widget>[
                              Radio(
                                groupValue: signupCompanyStore.active,
                                value: true,
                                onChanged: signupCompanyStore.setActive,
                              ),
                              Text('Sim'),
                              Radio(
                                groupValue: signupCompanyStore.active,
                                value: false,
                                onChanged: signupCompanyStore.setActive,
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
                              child: signupCompanyStore.loading
                                  ? CircularProgressIndicator(
                                      valueColor:
                                          AlwaysStoppedAnimation(Colors.white),
                                    )
                                  : Text(widget.isUpdate
                                      ? "ATUALIZAR"
                                      : "CADASTRAR"),
                              onPressed: widget.isUpdate
                                  ? signupCompanyStore.updatePressed
                                  : signupCompanyStore.signUpPressed,
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
    });
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
