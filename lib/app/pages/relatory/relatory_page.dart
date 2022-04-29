import 'package:avatende/app/components/custom_drawer/custom_drawer.dart';
import 'package:avatende/app/models/views/department_view_model.dart';
import 'package:avatende/app/models/views/user_view_model.dart';
import 'package:avatende/app/pages/relatory/enums/type_relatory_enum.dart';
import 'package:avatende/app/pages/relatory/relatory_result_page.dart';
import 'package:avatende/app/pages/relatory/widgets/date_range_widget.dart';
import 'package:avatende/app/pages/stores/relatory/relatory_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class RelatoryPage extends StatefulWidget {
  @override
  _RelatoryPageState createState() => _RelatoryPageState();
}

class _RelatoryPageState extends State<RelatoryPage> {
  final relatoryStore = GetIt.I<RelatoryStore>();

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction((_) => relatoryStore.generatedReport, (gen) {
      if (gen) {
        relatoryStore.setGeneratedReport(false);
        relatoryStore.cleanFieldsSelecteds();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => RelatoryResultPage(
                      relatories: relatoryStore.relatories,
                    )));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerar Relatório'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => relatoryStore.cleanFieldsSelecteds(),
            icon: Icon(Icons.cleaning_services),
          )
        ],
      ),
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DateRangePickerWidget(),
              SizedBox(height: 24),
              Text(
                "Relatório por: \n",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Observer(builder: (_) {
                return DropdownButtonFormField<TypeRelatory>(
                  value: relatoryStore.typeReportSelected,
                  isDense: true,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      isDense: true,
                      border: OutlineInputBorder()),
                  onChanged: (value) async {
                    relatoryStore.setTypeReportSelected(value);
                    await relatoryStore.getDepartments();
                  },
                  iconSize: 30,
                  hint: Text('Selecione o tipo de relatório'),
                  items: TypeRelatory.values
                      .map((subject) => DropdownMenuItem(
                            value: subject,
                            child:
                                Text(relatoryStore.getEnumDescription(subject)),
                          ))
                      .toList(),
                );
              }),
              SizedBox(
                height: 25,
              ),
              Observer(builder: (_) {
                return relatoryStore.showDepartments ||
                        relatoryStore.showAttendants
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Observer(builder: (_) {
                            return relatoryStore.showDepartments
                                ? Text("Departamentos: \n",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24))
                                : SizedBox(
                                    height: 0,
                                  );
                          }),
                          Observer(
                            builder: (_) {
                              return relatoryStore.showDepartments
                                  ? DropdownButtonFormField<
                                      DepartmentViewModel>(
                                      value: relatoryStore.departmentSelected,
                                      isDense: true,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          isDense: true,
                                          border: OutlineInputBorder()),
                                      onChanged: (value) async {
                                        if (value != null) {
                                          relatoryStore.departmentSelected =
                                              value;
                                          await relatoryStore.getAttendants(
                                              value.departmentId());
                                        }
                                      },
                                      onTap: () {},
                                      iconSize: 30,
                                      hint: Text('Selecione o departamento'),
                                      items: relatoryStore.departments
                                          .map((subject) => DropdownMenuItem(
                                                value: subject,
                                                child: Text(subject.name),
                                                onTap: () {},
                                              ))
                                          .toList(),
                                    )
                                  : SizedBox(
                                      height: 50,
                                    );
                            },
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Observer(builder: (_) {
                            return relatoryStore.showAttendants
                                ? Text("Atendentes: \n",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24))
                                : SizedBox(
                                    height: 0,
                                  );
                          }),
                          Observer(
                            builder: (_) {
                              return relatoryStore.showAttendants
                                  ? DropdownButtonFormField<UserViewModel>(
                                      value: relatoryStore.userSelected,
                                      isDense: true,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          isDense: true,
                                          border: OutlineInputBorder()),
                                      onChanged: (value) async {
                                        if (value != null) {
                                          relatoryStore.userSelected = value;
                                        }
                                      },
                                      iconSize: 30,
                                      hint: Text('Selecione o atendente'),
                                      items: relatoryStore.attendants
                                          .map((subject) => DropdownMenuItem(
                                                value: subject,
                                                child: Text(subject.name),
                                                onTap: () {},
                                              ))
                                          .toList(),
                                    )
                                  : SizedBox(
                                      height: 25,
                                    );
                            },
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      )
                    : SizedBox(
                        height: 0,
                      );
              }),
              Observer(builder: (_) {
                return Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(5),
                        fixedSize: MaterialStateProperty.all(Size(
                            screenSize.width * 0.5, screenSize.height * 0.075)),
                        shape: MaterialStateProperty.all(
                            new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20.0))),
                        textStyle:
                            MaterialStateProperty.all(TextStyle(fontSize: 24))),
                    onPressed: relatoryStore.generatePressed,
                    child: Text(
                      "Gerar",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
