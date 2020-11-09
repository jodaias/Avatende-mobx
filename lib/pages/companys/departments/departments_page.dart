import 'package:avatende/components/custom_drawer/custom_drawer.dart';
import 'package:avatende/models/department_model.dart';
import 'package:avatende/pages/companys/components/custom_floating_action_button/custom_floating_action_button.dart';
import 'package:avatende/pages/companys/components/custom_scaffold/custom_scaffold.dart';
import 'package:avatende/pages/companys/departments/users/users_page.dart';
import 'package:avatende/pages/signup/signup_page_department.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_it/get_it.dart';

class DepartmentsPage extends StatefulWidget {
  DepartmentsPage({Key key, this.title = "Departamentos"}) : super(key: key);

  final String title;

  @override
  _DepartmentsPageState createState() => _DepartmentsPageState();
}

class _DepartmentsPageState extends State<DepartmentsPage> {
  final appStore = GetIt.I<AppStore>();
  List<DepartmentModel> departList = [];
  List<DepartmentModel> departListInactive = [];
  List<DepartmentModel> _departList() {
    departList = [];
    departListInactive = [];

    departList.add(DepartmentModel(
        name: 'Departamento1', address: 'rua 01', active: false));
    departList.add(DepartmentModel(
        name: 'Departamento2', address: 'rua 02', active: false));
    departList.add(DepartmentModel(
        name: 'Departamento3', address: 'rua 03', active: true));
    departList.add(DepartmentModel(
        name: 'Departamento4', address: 'rua 04', active: false));
    departList.add(DepartmentModel(
        name: 'Departamento5', address: 'rua 05', active: true));
    departList.add(DepartmentModel(
        name: 'Departamento6', address: 'rua 06', active: false));

    for (var depart in departList) {
      if (!depart.active) departListInactive.add(depart);
    }

    return departListInactive;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      floatingActionButton: CustomFloatingActionButton(
        iconData: Icons.group_add,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SignUpDepartmentPage()));
        },
      ),
      drawer: appStore.userModel.userType == "2" ? CustomDrawer() : null,
      title: 'Departamentos',
      actives: 'Departamentos ativos',
      inactives: 'Departamentos inativos',
      widget: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: _departList == null ? 0 : _departList().length,
          itemBuilder: (context, index) {
            return Slidable(
              closeOnScroll: true,
              actionExtentRatio: 0.2,
              direction: Axis.horizontal,
              child: ListTile(
                title: Text(departListInactive[index].name),
                trailing: Wrap(
                  spacing: 12,
                  children: [
                    IconButton(
                      icon: Icon(Icons.visibility_outlined),
                      onPressed: () {
                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext ctx) {
                              return AlertDialog(
                                title: Text('Dados do departamento'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text(
                                        '\nNome: ${departListInactive[index].name}\nEndereço: ${departListInactive[index].address}\nAtivo? ${departListInactive[index].active}\n',
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => UsersPage()));
                      },
                    ),
                  ],
                ),
                onTap: () {
                  print(
                      'Dados do departamento:\n- ${departList[index].name}\n- ${departList[index].address}- \n${departList[index].active}\n');
                  showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext ctx) {
                        return AlertDialog(
                          title: Text('Dados do departamento'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text(
                                  '\nNome: ${departListInactive[index].name}\nEndereço: ${departListInactive[index].address}\nAtivo? ${departListInactive[index].active}\n',
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
                    print('Usuário: ${departList[index].name}');

                    String nomeAnterior = departListInactive[index].name;
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
                            initialValue: departListInactive[index].name,
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
                                'Esta ação irá desativar o departamento selecionado!'),
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
