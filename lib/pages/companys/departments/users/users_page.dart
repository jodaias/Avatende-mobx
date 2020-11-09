import 'package:avatende/models/user_model.dart';
import 'package:avatende/pages/companys/components/custom_floating_action_button/custom_floating_action_button.dart';
import 'package:avatende/pages/companys/components/custom_scaffold/custom_scaffold.dart';
import 'package:avatende/pages/signup/signup_user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class UsersPage extends StatefulWidget {
  UsersPage({Key key, this.title = "Usuários"}) : super(key: key);

  final String title;

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<UserModel> userList = [];
  List<UserModel> userListInactive = [];
  List<UserModel> _userList() {
    userList = [];
    userListInactive = [];

    userList.add(UserModel(
        name: 'jodaias1', email: 'jodaias1@gmail.com', active: false));
    userList.add(UserModel(
        name: 'jodaias2', email: 'jodaias2@gmail.com', active: false));
    userList.add(
        UserModel(name: 'jodaias3', email: 'jodaias3@gmail.com', active: true));
    userList.add(UserModel(
        name: 'jodaias4', email: 'jodaias4@gmail.com', active: false));
    userList.add(
        UserModel(name: 'jodaias5', email: 'jodaias5@gmail.com', active: true));
    userList.add(UserModel(
        name: 'jodaias6', email: 'jodaias6@gmail.com', active: false));

    for (var item in userList) {
      if (!item.active) userListInactive.add(item);
    }

    return userListInactive;
  }

  inactiveList() {}

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      floatingActionButton: CustomFloatingActionButton(
        iconData: Icons.add,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SignUpUserPage()));
        },
      ),
      title: 'Usuários',
      actives: 'Usuários ativos',
      inactives: 'Usuários inativos',
      widget: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: _userList == null ? 0 : _userList().length,
          itemBuilder: (context, index) {
            return Slidable(
              closeOnScroll: true,
              actionExtentRatio: 0.2,
              direction: Axis.horizontal,
              child: ListTile(
                title: Text(userListInactive[index].name),
                trailing: Icon(Icons.visibility_outlined),
                onTap: () {
                  showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext ctx) {
                        return AlertDialog(
                          title: Text('Dados do usuário'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text(
                                  '\nNome: ${userListInactive[index].name}\nEmail: ${userListInactive[index].email}\nAtivo? ${userListInactive[index].active}\n',
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
                    print('Usuário: ${userList[index].name}');

                    String nomeAnterior = userListInactive[index].name;
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
                            initialValue: userListInactive[index].name,
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
                                'Esta ação irá desativar o atendente selecionado!'),
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
