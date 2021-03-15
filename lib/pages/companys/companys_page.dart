import 'package:avatende/components/custom_drawer/custom_drawer.dart';
import 'package:avatende/models/views/company_view_model.dart';
import 'package:avatende/pages/companys/components/custom_floating_action_button/custom_floating_action_button.dart';
import 'package:avatende/pages/companys/departments/departments_page.dart';
import 'package:avatende/pages/companys/departments/users/users_page.dart';
import 'package:avatende/pages/signup/signup_company_page.dart';
import 'package:avatende/pages/stores/company/company_store.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_it/get_it.dart';

class CompanysPage extends StatefulWidget {
  CompanysPage({Key key, this.title = "Empresas"}) : super(key: key);

  final String title;

  @override
  _CompanysPageState createState() => _CompanysPageState();
}

class _CompanysPageState extends State<CompanysPage> {
  final companyStore = new CompanyStore();
  final appStore = GetIt.I<AppStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          Observer(builder: (_) {
            return Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: PopupMenuButton<ActivesOrOrderByCompany>(
                itemBuilder: (context) =>
                    <PopupMenuEntry<ActivesOrOrderByCompany>>[
                  PopupMenuItem<ActivesOrOrderByCompany>(
                    child: Text('Empresas ativas'),
                    value: ActivesOrOrderByCompany.actives,
                  ),
                  PopupMenuItem<ActivesOrOrderByCompany>(
                    child: Text('Empresas inativas'),
                    value: ActivesOrOrderByCompany.inactives,
                  ),
                  // PopupMenuItem<ActivesOrOrderByCompany>(
                  //   child: Text('Ordenar de A-Z'),
                  //   value: ActivesOrOrderByCompany.orderByAZ,
                  // ),
                  // PopupMenuItem<ActivesOrOrderByCompany>(
                  //   child: Text('Ordenar de Z-A'),
                  //   value: ActivesOrOrderByCompany.orderByZA,
                  // ),
                ],
                onSelected: companyStore.activeOrOrderList,
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
      drawer: CustomDrawer(),
      floatingActionButton: CustomFloatingActionButton(
        iconData: Icons.add_business,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SignUpCompanyPage()));
        },
      ),
      body: Container(
        child: Observer(
          builder: (_) {
            return StreamBuilder<List<CompanyViewModel>>(
              stream: companyStore.listActive
                  ? companyStore.companyList
                  : companyStore.companyListInactive,
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
                    children: snapshot.data.map((company) {
                      return Slidable(
                        closeOnScroll: true,
                        actionExtentRatio: 0.2,
                        direction: Axis.horizontal,
                        child: ListTile(
                          title: Text('${company.name}'),
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
                                                  '\nNome: ${company.name}\nTelefone: ${company.phone}\nEndereço: ${company.address}\nAtiva?  ${company.active ? "Sim" : "Não"}\n',
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                Colors.white,
                                              )),
                                              child: Text('Ok',
                                                  style: TextStyle(
                                                      color:
                                                          Colors.purple[400])),
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
                                  appStore.userViewModel.userType != "Master"
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => DepartmentsPage(
                                              companyId: company.companyId(),
                                            ),
                                          ),
                                        )
                                      : Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => UsersPage(
                                              companyId: company.companyId(),
                                            ),
                                          ),
                                        );
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
                                            '\nNome: ${company.name}\nTelefone: ${company.phone}\nEndereço: ${company.address}\nAtiva? ${company.active ? "Sim" : "Não"}\n',
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                          Colors.white,
                                        )),
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
                        secondaryActions: <Widget>[
                          IconSlideAction(
                            caption: 'Editar',
                            icon: Icons.edit,
                            color: Colors.black,
                            onTap: () {
                              //=> pegar a empresa
                              print('Empresa: ${company.name}');

                              String nomeAnterior = company.name;
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
                                      initialValue: company.name,
                                      decoration: InputDecoration(
                                          hintText: 'Nome',
                                          contentPadding: EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
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
                                        ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                            Colors.white,
                                          )),
                                          child: Text('Cancelar',
                                              style:
                                                  TextStyle(color: Colors.red)),
                                          onPressed: () {
                                            Navigator.of(ctx).pop();
                                          },
                                        ),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                            Colors.white,
                                          )),
                                          child: Text('Salvar',
                                              style: TextStyle(
                                                  color: Colors.purple[400])),
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
                                        ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                            Colors.purple[400],
                                          )),
                                          child: Text('Cancelar',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          onPressed: () {
                                            Navigator.of(ctx).pop();
                                          },
                                        ),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                            Colors.purple[400],
                                          )),
                                          onPressed: () {
                                            setState(() {
                                              //alguma ação para desativar o usuario
                                            });
                                            Navigator.of(ctx).pop();
                                          },
                                          child: null,
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
  }
}
