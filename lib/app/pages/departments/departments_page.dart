import 'package:avatende/app/components/custom_drawer/custom_drawer.dart';
import 'package:avatende/app/enums/user-type.dart';
import 'package:avatende/app/models/views/department_view_model.dart';
import 'package:avatende/app/pages/companys/components/custom_floating_action_button/custom_floating_action_button.dart';
import 'package:avatende/app/pages/users/users_page.dart';
import 'package:avatende/app/pages/signup/signup_page_department.dart';
import 'package:avatende/app/pages/stores/department/department_store.dart';
import 'package:avatende/app/storesGlobal/app_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_it/get_it.dart';

class DepartmentsPage extends StatefulWidget {
  DepartmentsPage({Key? key, this.title = "Departamentos", this.companyId})
      : super(key: key);

  final String title;
  final String? companyId;

  @override
  _DepartmentsPageState createState() => _DepartmentsPageState();
}

class _DepartmentsPageState extends State<DepartmentsPage> {
  final appStore = GetIt.I<AppStore>();
  final departmentStore = new DepartmentStore();

  @override
  void initState() {
    super.initState();
    setState(() {
      departmentStore.setCompanyId(widget.companyId!);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('company id: ${departmentStore.companyId}');
    return Observer(builder: (_) {
      return Scaffold(
        floatingActionButton: CustomFloatingActionButton(
          iconData: Icons.group_add,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SignUpDepartmentPage(
                          companyId: widget.companyId!,
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
                child: PopupMenuButton<ActivesOrOrderByDepartment>(
                  itemBuilder: (context) =>
                      <PopupMenuEntry<ActivesOrOrderByDepartment>>[
                    PopupMenuItem<ActivesOrOrderByDepartment>(
                      child: Text('Departamentos ativos'),
                      value: ActivesOrOrderByDepartment.actives,
                    ),
                    PopupMenuItem<ActivesOrOrderByDepartment>(
                      child: Text('Departamentos inativos'),
                      value: ActivesOrOrderByDepartment.inactives,
                    ),
                    PopupMenuItem<ActivesOrOrderByDepartment>(
                      child: Text('Ordenar de A-Z'),
                      value: ActivesOrOrderByDepartment.orderByAZ,
                    ),
                    PopupMenuItem<ActivesOrOrderByDepartment>(
                      child: Text('Ordenar de Z-A'),
                      value: ActivesOrOrderByDepartment.orderByZA,
                    ),
                  ],
                  onSelected: departmentStore.activeOrOrderList,
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
        drawer: appStore.userViewModel!.userType == UserType.Admin
            ? CustomDrawer()
            : null,
        body: Container(
          child: Observer(
            builder: (_) {
              return StreamBuilder<List<DepartmentViewModel>>(
                stream: departmentStore.departmentList,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.data!.isEmpty) {
                    return Container(
                      padding: EdgeInsets.all(30),
                      child: Text(departmentStore.listActive
                          ? 'Desculpe, nenhum departamento cadastrado.'
                          : 'Desculpe, nenhum departamento inativo.'),
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
                      children: snapshot.data!.map((department) {
                        return Slidable(
                          closeOnScroll: true,
                          direction: Axis.horizontal,
                          startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: <Widget>[
                              department.active
                                  ? SlidableAction(
                                      onPressed: (context) {
                                        showDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            builder: (BuildContext ctx) {
                                              final input = Form(
                                                  child: TextFormField(
                                                autofocus: true,
                                                initialValue: department.name,
                                                decoration: InputDecoration(
                                                    hintText: 'Nome',
                                                    contentPadding:
                                                        EdgeInsets.fromLTRB(
                                                            20, 10, 20, 10),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5))),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Este campo não pode ficar vazio';
                                                  }
                                                  return null;
                                                },
                                                onChanged:
                                                    departmentStore.setName,
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
                                                            MaterialStateProperty
                                                                .all(
                                                      Colors.white,
                                                    )),
                                                    child: Text('Cancelar',
                                                        style: TextStyle(
                                                            color: Colors.red)),
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
                                                    child: Text('Salvar',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .greenAccent)),
                                                    onPressed: () {
                                                      var departmentData = {
                                                        "Name":
                                                            departmentStore.name
                                                      };

                                                      departmentStore
                                                          .updateDepartments(
                                                              department
                                                                  .departmentId(),
                                                              departmentData);
                                                      Navigator.of(ctx).pop();
                                                    },
                                                  )
                                                ],
                                              );
                                            });
                                      },
                                      backgroundColor: Color(0xFFFE4A49),
                                      foregroundColor: Colors.black,
                                      icon: Icons.edit,
                                      label: 'Editar',
                                    )
                                  : Container(),
                              SlidableAction(
                                onPressed: (context) {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (BuildContext ctx) {
                                        return AlertDialog(
                                          title: Text('Tem certeza?'),
                                          content: Text(department.active
                                              ? 'Esta ação irá desativar o departamento selecionado!'
                                              : 'Esta ação irá ativar o departamento selecionado!'),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                Colors.greenAccent,
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
                                                child: Text(
                                                    department.active
                                                        ? 'Desativar'
                                                        : 'Ativar',
                                                    style: TextStyle(
                                                        color: Colors.red)),
                                                onPressed: () {
                                                  var departData = {
                                                    "Active": !department.active
                                                  };

                                                  departmentStore
                                                      .updateDepartments(
                                                          department
                                                              .departmentId(),
                                                          departData);
                                                  Navigator.of(ctx).pop();
                                                })
                                          ],
                                        );
                                      });
                                },
                                foregroundColor: Colors.red[400],
                                icon: Icons.block,
                                label:
                                    department.active ? 'Desativar' : 'Ativar',
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: Text(department.name),
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
                                            title:
                                                Text('Dados do departamento'),
                                            content: SingleChildScrollView(
                                              child: ListBody(
                                                children: <Widget>[
                                                  Text(
                                                    '\nNome: ${department.name}\nPhone: ${department.phone}\nAtivo? ${department.active ? "Sim" : "Não"}\n',
                                                  ),
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(
                                                  Colors.white,
                                                )),
                                                child: Text('Ok',
                                                    style: TextStyle(
                                                        color: Colors
                                                            .purple[400])),
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
                                    print(
                                        'departPage depId: ${department.companyId}');
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => UsersPage(
                                                  departmentId:
                                                      department.departmentId(),
                                                  companyId:
                                                      department.companyId,
                                                )));
                                  },
                                ),
                              ],
                            ),
                            onTap: () {
                              print(
                                  'Dados do departamento:\n- ${department.name}\n- ${department.active ? "Sim" : "Não"}\n');
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
                                              '\nNome: ${department.name}\nPhone: ${department.phone}\nAtivo? ${department.active ? "Sim" : "Não"}\n',
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
                                                  color: Colors.purple[700])),
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
    });
  }
}
