import 'package:avatende/components/custom_drawer/custom_drawer.dart';
import 'package:avatende/models/company_model.dart';
import 'package:avatende/pages/companys/components/custom_floating_action_button/custom_floating_action_button.dart';
import 'package:avatende/pages/companys/components/custom_scaffold/custom_scaffold.dart';
import 'package:avatende/pages/companys/departments/departments_page.dart';
import 'package:avatende/pages/signup/signup_company_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

enum Actives {
  actives,
  desactives,
}

enum OrderBy {
  orderAZ,
  orderZA,
}

class CompanysPage extends StatefulWidget {
  CompanysPage({Key key, this.title = "Empresas"}) : super(key: key);

  final String title;

  @override
  _CompanysPageState createState() => _CompanysPageState();
}

class _CompanysPageState extends State<CompanysPage> {
  List<CompanyModel> companyList = [];
  List<CompanyModel> companyListInactive = [];
  List<CompanyModel> _companyList() {
    companyList = [];
    companyListInactive = [];

    companyList
        .add(CompanyModel(name: 'Empresa1', address: 'rua 01', active: false));
    companyList
        .add(CompanyModel(name: 'Empresa2', address: 'rua 02', active: false));
    companyList
        .add(CompanyModel(name: 'Empresa3', address: 'rua 03', active: true));
    companyList
        .add(CompanyModel(name: 'Empresa4', address: 'rua 04', active: false));
    companyList
        .add(CompanyModel(name: 'Empresa5', address: 'rua 05', active: true));
    companyList
        .add(CompanyModel(name: 'Empresa6', address: 'rua 06', active: false));

    for (var company in companyList) {
      if (!company.active) companyListInactive.add(company);
    }

    return companyListInactive;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      drawer: CustomDrawer(),
      floatingActionButton: CustomFloatingActionButton(
        iconData: Icons.add_business,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SignUpCompanyPage()));
        },
      ),
      title: 'Empresas',
      actives: 'Empresas ativas',
      inactives: 'Empresas inativas',
      widget: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: _companyList == null ? 0 : _companyList().length,
          itemBuilder: (context, index) {
            return Slidable(
              closeOnScroll: true,
              actionExtentRatio: 0.2,
              direction: Axis.horizontal,
              child: ListTile(
                title: Text(companyListInactive[index].name),
                //trailing: Icon(Icons.arrow_forward_ios),
                trailing: Wrap(
                  spacing: 12, // space between two icons
                  children: [
                    IconButton(
                      icon: Icon(Icons.visibility_outlined),
                      onPressed: () {
                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext ctx) {
                              return AlertDialog(
                                title: Text('Dados da empresa'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text(
                                        '\nNome: ${companyListInactive[index].name}\nEndereço: ${companyListInactive[index].address}\nAtivo? ${companyListInactive[index].active}\n',
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  RaisedButton(
                                    color: Colors.white,
                                    child: Text('Ok',
                                        style: TextStyle(
                                            color: Colors.greenAccent)),
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                  )
                                ],
                              );
                            });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DepartmentsPage()));
                      },
                    ),
                  ],
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext ctx) {
                        return AlertDialog(
                          title: Text('Dados da empresa'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text(
                                  '\nNome: ${companyListInactive[index].name}\nEndereço: ${companyListInactive[index].address}\nAtivo? ${companyListInactive[index].active}\n',
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            RaisedButton(
                              color: Colors.white,
                              child: Text('Ok',
                                  style: TextStyle(color: Colors.greenAccent)),
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                            )
                          ],
                        );
                      });
                },
              ),
              secondaryActions: <Widget>[
                IconSlideAction(
                  caption: 'Editar',
                  icon: Icons.edit,
                  color: Colors.black,
                  onTap: () {
                    //=> pegar o usuario
                    print('Empresa: ${companyList[index].name}');

                    String nomeAnterior = companyListInactive[index].name;
                    print('Nome anterior: $nomeAnterior');
                    //joga no campo de texto o nomeAnterior
                    print('Nome anterior jogado no campo de text');

                    showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext ctx) {
                          final input = Form(
                              child: TextFormField(
                            autofocus: true,
                            initialValue: companyListInactive[index].name,
                            decoration: InputDecoration(
                                hintText: 'Nome',
                                contentPadding:
                                    EdgeInsets.fromLTRB(20, 10, 20, 10),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Este campo não pode ficar vazio';
                              }
                              return null;
                            },
                          ));

                          return AlertDialog(
                            title: Text('Editar nome'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[input],
                              ),
                            ),
                            actions: <Widget>[
                              RaisedButton(
                                color: Colors.white,
                                child: Text('Cancelar',
                                    style: TextStyle(color: Colors.red)),
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                              ),
                              RaisedButton(
                                color: Colors.white,
                                child: Text('Salvar',
                                    style:
                                        TextStyle(color: Colors.greenAccent)),
                                onPressed: () {
                                  //atualiza a informação no banco de dados
                                  //salva um dado na tabela LOG dizendo que atualizou um dado
                                  print('dados atualizados');
                                  print('dados salvos na tabela LOG');
                                  Navigator.of(ctx).pop();
                                },
                              )
                            ],
                          );
                        });
                  },
                ),
                IconSlideAction(
                  caption: 'Desativar',
                  icon: Icons.block,
                  color: Colors.red[400],
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext ctx) {
                          return AlertDialog(
                            title: Text('Tem certeza?'),
                            content: Text(
                                'Esta ação irá desativar a empresa selecionada!'),
                            actions: <Widget>[
                              RaisedButton(
                                color: Colors.greenAccent,
                                child: Text('Cancelar',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                              ),
                              RaisedButton(
                                  color: Colors.white,
                                  child: Text('Desativar',
                                      style: TextStyle(color: Colors.red)),
                                  onPressed: () {
                                    setState(() {
                                      //alguma ação para desativar o usuario
                                    });
                                    Navigator.of(ctx).pop();
                                  })
                            ],
                          );
                        });
                  },
                ),
              ],
              actionPane: SlidableBehindActionPane(),
            );
          }),
    );
  }
}
