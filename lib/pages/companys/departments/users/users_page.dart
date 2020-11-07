import 'package:avatende/pages/companys/components/custom_floating_action_button/custom_floating_action_button.dart';
import 'package:avatende/pages/companys/components/custom_scaffold/custom_scaffold.dart';
import 'package:avatende/pages/signup/signup_user_page.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  UsersPage({Key key, this.title = "Usuários"}) : super(key: key);

  final String title;

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List userList = List();

  @override
  Widget build(BuildContext context) {
    userList.add('user1');

    return CustomScaffold(
        floatingActionButton: CustomFloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpUserPage()));
          },
        ),
        title: 'Usuários',
        actives: 'Usuários ativos',
        inactives: 'Usuários inativos',
        widget: Column(
          children: [
            Text('Jodaias Barreto'),
            // ListView(
            //   children: userList.map((list) {
            //     return Slidable(
            //       closeOnScroll: true,
            //       actionExtentRatio: 0.2,
            //       direction: Axis.horizontal,
            //       child: ListTile(
            //         title: Text('Jodaías'),
            //         trailing: Icon(Icons.arrow_back_ios),
            //         onTap: () {},
            //       ),
            //       secondaryActions: <Widget>[
            //         IconSlideAction(
            //           caption: 'Editar',
            //           icon: Icons.edit,
            //           color: Colors.black,
            //           onTap: () async {
            //             //=> pegar o usuario
            //             print('Usuário: ${list['name']}');

            //             //String nomeAnterior = salvar o nome anterior do usuário
            //             print('Nome anterior: ${list['name']}');
            //             //joga no campo de texto o nomeAnterior
            //             print('Nome anterior jogado no campo de text');

            //             showDialog(
            //                 context: context,
            //                 barrierDismissible: true,
            //                 builder: (BuildContext ctx) {
            //                   final input = Form(
            //                       child: TextFormField(
            //                     autofocus: true,
            //                     decoration: InputDecoration(
            //                         hintText: 'Nome',
            //                         contentPadding:
            //                             EdgeInsets.fromLTRB(20, 10, 20, 10),
            //                         border: OutlineInputBorder(
            //                             borderRadius:
            //                                 BorderRadius.circular(5))),
            //                     validator: (value) {
            //                       if (value.isEmpty) {
            //                         return 'Este campo não pode ficar vazio';
            //                       }
            //                       return null;
            //                     },
            //                   ));

            //                   return AlertDialog(
            //                     title: Text('Editar nome'),
            //                     content: SingleChildScrollView(
            //                       child: ListBody(
            //                         children: <Widget>[input],
            //                       ),
            //                     ),
            //                     actions: <Widget>[
            //                       RaisedButton(
            //                         color: Colors.white,
            //                         child: Text('Cancelar',
            //                             style: TextStyle(color: Colors.red)),
            //                         onPressed: () {
            //                           Navigator.of(ctx).pop();
            //                         },
            //                       ),
            //                       RaisedButton(
            //                         color: Colors.white,
            //                         child: Text('Salvar',
            //                             style: TextStyle(
            //                                 color: Colors.greenAccent)),
            //                         onPressed: () {
            //                           //atualiza a informação no banco de dados
            //                           //salva um dado na tabela LOG dizendo que atualizou um dado
            //                           print('dados atualizados');
            //                           print('dados salvos na tabela LOG');
            //                           Navigator.of(ctx).pop();
            //                         },
            //                       )
            //                     ],
            //                   );
            //                 });
            //           },
            //         ),
            //         IconSlideAction(
            //           caption: 'Desativar',
            //           icon: Icons.block,
            //           color: Colors.red[400],
            //           onTap: () {
            //             showDialog(
            //                 context: context,
            //                 barrierDismissible: true,
            //                 builder: (BuildContext ctx) {
            //                   return AlertDialog(
            //                     title: Text('Tem certeza?'),
            //                     content: Text(
            //                         'Esta ação irá desativar o atendente selecionado e não poderá ser desfeita!'),
            //                     actions: <Widget>[
            //                       RaisedButton(
            //                         color: Colors.greenAccent,
            //                         child: Text('Cancelar',
            //                             style: TextStyle(color: Colors.white)),
            //                         onPressed: () {
            //                           Navigator.of(ctx).pop();
            //                         },
            //                       ),
            //                       RaisedButton(
            //                           color: Colors.white,
            //                           child: Text('Desativar',
            //                               style: TextStyle(color: Colors.red)),
            //                           onPressed: () {
            //                             setState(() {
            //                               //alguma ação para desativar o usuario
            //                             });
            //                             Navigator.of(ctx).pop();
            //                           })
            //                     ],
            //                   );
            //                 });
            //           },
            //         ),
            //       ],
            //       actionPane: SlidableBehindActionPane(),
            //     );
            //   }).toList(),
            // )
          ],
        ));
  }
}
