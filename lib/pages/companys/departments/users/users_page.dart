import 'package:avatende/models/user_model.dart';
import 'package:avatende/pages/companys/components/custom_floating_action_button/custom_floating_action_button.dart';
import 'package:avatende/pages/companys/components/custom_scaffold/custom_scaffold.dart';
import 'package:avatende/pages/signup/signup_user_page.dart';
import 'package:avatende/pages/stores/company/department/user/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class UsersPage extends StatefulWidget {
  UsersPage({Key key, this.title = "Usuários"}) : super(key: key);

  final String title;

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final userStore = UserStore();

  inactiveList() {}

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      var list = userStore.listUsers();
      if (userStore.orderByAz) {
        list.sort(
            (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      } else {
        list.sort(
            (a, b) => b.name.toLowerCase().compareTo(a.name.toLowerCase()));
      }
      return Scaffold(
        floatingActionButton: CustomFloatingActionButton(
          iconData: Icons.add,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpUserPage()));
          },
        ),
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          actions: [
            Observer(builder: (_) {
              return Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: PopupMenuButton<ActivesOrOrderByUser>(
                  itemBuilder: (context) =>
                      <PopupMenuEntry<ActivesOrOrderByUser>>[
                    PopupMenuItem<ActivesOrOrderByUser>(
                      child: Text('usuários ativos'),
                      value: ActivesOrOrderByUser.actives,
                    ),
                    PopupMenuItem<ActivesOrOrderByUser>(
                      child: Text('usuários inativos'),
                      value: ActivesOrOrderByUser.inactives,
                    ),
                    PopupMenuItem<ActivesOrOrderByUser>(
                      child: Text('Ordenar de A-Z'),
                      value: ActivesOrOrderByUser.orderByAZ,
                    ),
                    PopupMenuItem<ActivesOrOrderByUser>(
                      child: Text('Ordenar de Z-A'),
                      value: ActivesOrOrderByUser.orderByZA,
                    ),
                  ],
                  onSelected: userStore.activeOrOrderList,
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              );
            })
          ],
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: list == null ? 0 : list.length,
            itemBuilder: (context, index) {
              return Slidable(
                closeOnScroll: true,
                actionExtentRatio: 0.2,
                direction: Axis.horizontal,
                child: ListTile(
                  title: Text(list[index].name),
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
                                    '\nNome: ${list[index].name}\nEmail: ${list[index].email}\nAtivo? ${list[index].active}\n',
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              RaisedButton(
                                color: Colors.white,
                                child: Text('Ok',
                                    style:
                                        TextStyle(color: Colors.greenAccent)),
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
                  list[index].active
                      ? IconSlideAction(
                          caption: 'Editar',
                          icon: Icons.edit,
                          color: Colors.black,
                          onTap: () {
                            //=> pegar o usuario
                            print('Usuário: ${list[index].name}');

                            String nomeAnterior = list[index].name;
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
                                    initialValue: list[index].name,
                                    decoration: InputDecoration(
                                        hintText: 'Nome',
                                        contentPadding:
                                            EdgeInsets.fromLTRB(20, 10, 20, 10),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5))),
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
                                            style:
                                                TextStyle(color: Colors.red)),
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                        },
                                      ),
                                      RaisedButton(
                                        color: Colors.white,
                                        child: Text('Salvar',
                                            style: TextStyle(
                                                color: Colors.greenAccent)),
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
                        )
                      : null,
                  IconSlideAction(
                    caption: list[index].active ? 'Desativar' : 'Ativar',
                    icon: Icons.block,
                    color: Colors.red[400],
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext ctx) {
                            return AlertDialog(
                              title: Text('Tem certeza?'),
                              content: Text(list[index].active
                                  ? 'Esta ação irá desativar o usuário selecionado!'
                                  : 'Esta ação irá ativar o usuário selecionado!'),
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
                                    child: Text(
                                        list[index].active
                                            ? 'Desativar'
                                            : 'Ativar',
                                        style: TextStyle(color: Colors.red)),
                                    onPressed: () {
                                      if (list[index].active) {
                                        //alguma ação para desativar o usuario
                                      } else {
                                        //alguma ação para ativar o usuario
                                      }
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
    });
  }
}
