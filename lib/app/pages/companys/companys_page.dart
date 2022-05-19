import 'package:avatende/app/components/custom_drawer/custom_drawer.dart';
import 'package:avatende/app/enums/user-type.dart';
import 'package:avatende/app/models/views/company_view_model.dart';
import 'package:avatende/app/pages/companys/components/custom_floating_action_button/custom_floating_action_button.dart';
import 'package:avatende/app/pages/departments/departments_page.dart';
import 'package:avatende/app/pages/users/users_page.dart';
import 'package:avatende/app/pages/signup/signup_company_page.dart';
import 'package:avatende/app/pages/stores/company/company_store.dart';
import 'package:avatende/app/storesGlobal/app_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_it/get_it.dart';

class CompanysPage extends StatefulWidget {
  CompanysPage({Key? key, this.title = "Empresas"}) : super(key: key);

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
                  PopupMenuItem<ActivesOrOrderByCompany>(
                    child: Text('Ordenar de A-Z'),
                    value: ActivesOrOrderByCompany.orderByAZ,
                  ),
                  PopupMenuItem<ActivesOrOrderByCompany>(
                    child: Text('Ordenar de Z-A'),
                    value: ActivesOrOrderByCompany.orderByZA,
                  ),
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
              stream: companyStore.companyList,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.data!.isEmpty) {
                  return Container(
                    padding: EdgeInsets.all(30),
                    child: Text(companyStore.listActive
                        ? 'Desculpe, nenhuma empresa cadastrada.'
                        : 'Desculpe, nenhuma empresa inativa.'),
                  );
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
                    children: snapshot.data!.map((company) {
                      return Slidable(
                        closeOnScroll: true,
                        direction: Axis.horizontal,
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: company.active
                              ? <Widget>[
                                  SlidableAction(
                                    onPressed: (context) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => SignUpCompanyPage(
                                                    companyViewModel: company,
                                                    isUpdate: true,
                                                  )));
                                    },
                                    backgroundColor: Colors.black87,
                                    foregroundColor: Colors.white,
                                    icon: Icons.edit,
                                    label: 'Editar',
                                  ),
                                  SlidableAction(
                                    onPressed: (context) {
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
                                                          MaterialStateProperty
                                                              .all(
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
                                                          MaterialStateProperty
                                                              .all(
                                                    Colors.white,
                                                  )),
                                                  onPressed: () {
                                                    companyStore.updateCompany(
                                                        company.companyId()!,
                                                        {'Active': false});
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Text('Desativar',
                                                      style: TextStyle(
                                                          color: Colors
                                                              .purple[400])),
                                                )
                                              ],
                                            );
                                          });
                                    },
                                    backgroundColor: Colors.redAccent,
                                    foregroundColor: Colors.white,
                                    icon: Icons.block,
                                    label: 'Desativar',
                                  ),
                                ]
                              : <Widget>[
                                  SlidableAction(
                                    onPressed: (context) {
                                      showDialog(
                                          context: context,
                                          barrierDismissible: true,
                                          builder: (BuildContext ctx) {
                                            return AlertDialog(
                                              title: Text('Tem certeza?'),
                                              content: Text(
                                                  'Esta ação irá ativar a compania selecionada!'),
                                              actions: <Widget>[
                                                ElevatedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(
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
                                                          MaterialStateProperty
                                                              .all(
                                                    Colors.white,
                                                  )),
                                                  child: Text('Ativar',
                                                      style: TextStyle(
                                                          color: Colors
                                                              .purple[400])),
                                                  onPressed: () {
                                                    //alguma ação para ativar o usuario
                                                    companyStore.updateCompany(
                                                        company.companyId()!,
                                                        {'Active': true});
                                                    Navigator.of(ctx).pop();
                                                  },
                                                )
                                              ],
                                            );
                                          });
                                    },
                                    backgroundColor: Colors.redAccent,
                                    foregroundColor: Colors.white,
                                    icon: Icons.block,
                                    label: 'Ativar',
                                  ),
                                ],
                        ),
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
                                  appStore.userViewModel!.userType !=
                                          UserType.Master
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => DepartmentsPage(
                                              companyId:
                                                  company.companyId() ?? "",
                                            ),
                                          ),
                                        )
                                      : Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => UsersPage(
                                              companyId: company.companyId()!,
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
