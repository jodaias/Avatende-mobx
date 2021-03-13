import 'package:avatende/models/views/user_view_model.dart';
import 'package:avatende/pages/companys/components/custom_floating_action_button/custom_floating_action_button.dart';
import 'package:avatende/pages/signup/signup_user_page.dart';
import 'package:avatende/pages/stores/company/department/user/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class UsersPage extends StatefulWidget {
  UsersPage(
      {Key key, this.title = "Usuários", this.departmentId, this.companyId})
      : super(key: key);

  final String title;
  final String departmentId;
  final String companyId;

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final userStore = UserStore();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      userStore.setDepartmentId(widget.departmentId);
      userStore.setCompanyId(widget.companyId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        floatingActionButton: CustomFloatingActionButton(
          iconData: Icons.add,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SignUpUserPage(
                          companyId: widget.companyId,
                          departmentId: widget.departmentId,
                          isUpdate: false,
                        )));
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
        body: Container(
          child: Observer(
            builder: (_) {
              return StreamBuilder<List<UserViewModel>>(
                stream: userStore.listActive
                    ? userStore.userList
                    : userStore.userListInactive,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.connectionState == ConnectionState.none) {
                    return Center(child: Text('Verifique sua conexão'));
                  }

                  if (snapshot.hasError) {
                    return Center(
                        child: Text("Erro ao tentar recuperar os dados"));
                  }

                  return Container(
                    child: ListView(
                      children: snapshot.data.map((user) {
                        return Slidable(
                          closeOnScroll: true,
                          actionExtentRatio: 0.2,
                          direction: Axis.horizontal,
                          child: ListTile(
                            title: Text(user.name),
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
                                              '\nNome: ${user.name}\nEmail: ${user.email}\nPhone: ${user.phone}\nEndereço: ${user.address}\nAtivo? ${user.active ? "Sim" : "Não"}\n',
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        RaisedButton(
                                          color: Colors.white,
                                          child: Text('Ok',
                                              style: TextStyle(
                                                  color: Colors.purple[400])),
                                          onPressed: () {
                                            Navigator.of(ctx).pop();
                                          },
                                        )
                                      ],
                                    );
                                  });
                            },
                          ),
                          secondaryActions: user.active
                              ? <Widget>[
                                  IconSlideAction(
                                    caption: 'Editar',
                                    icon: Icons.edit,
                                    color: Colors.black,
                                    onTap: () {
                                      //=> pegar o usuario
                                      print('Usuário: ${user.name}');

                                      String nomeAnterior = user.name;
                                      print('Nome anterior: $nomeAnterior');
                                      //joga no campo de texto o nomeAnterior
                                      print(
                                          'Nome anterior jogado no campo de text');
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => SignUpUserPage(
                                                    userViewModel: user,
                                                    isUpdate: true,
                                                  )));
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
                                                  'Esta ação irá desativar o usuário selecionado!'),
                                              actions: <Widget>[
                                                RaisedButton(
                                                  color: Colors.purple[400],
                                                  child: Text('Cancelar',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                  onPressed: () {
                                                    Navigator.of(ctx).pop();
                                                  },
                                                ),
                                                RaisedButton(
                                                  color: Colors.white,
                                                  child: Text('Desativar',
                                                      style: TextStyle(
                                                          color: Colors
                                                              .purple[400])),
                                                  onPressed: () {
                                                    userStore.updateUser(
                                                        user.userId(),
                                                        {'Active': false});
                                                    Navigator.of(ctx).pop();
                                                  },
                                                )
                                              ],
                                            );
                                          });
                                    },
                                  ),
                                ]
                              : <Widget>[
                                  IconSlideAction(
                                    caption: 'Ativar',
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
                                                  'Esta ação irá ativar o usuário selecionado!'),
                                              actions: <Widget>[
                                                RaisedButton(
                                                  color: Colors.purple[400],
                                                  child: Text('Cancelar',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                  onPressed: () {
                                                    Navigator.of(ctx).pop();
                                                  },
                                                ),
                                                RaisedButton(
                                                  color: Colors.white,
                                                  child: Text('Ativar',
                                                      style: TextStyle(
                                                          color: Colors
                                                              .purple[400])),
                                                  onPressed: () {
                                                    //alguma ação para ativar o usuario
                                                    userStore.updateUser(
                                                        user.userId(),
                                                        {'Active': true});
                                                    Navigator.of(ctx).pop();
                                                  },
                                                )
                                              ],
                                            );
                                          });
                                    },
                                  ),
                                ],
                          actionPane: SlidableBehindActionPane(),
                        );
                      }).toList(),
                    ),
                  );
                },
              );
            },
          ),
        ),
      );
    });
  }
}
