import 'package:avatende/app/models/views/relatory_view_model.dart';
import 'package:avatende/app/pages/relatory/widgets/two_action_fab_widget.dart';
import 'package:avatende/app/pages/stores/relatory/relatory_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class RelatoryResultPage extends StatefulWidget {
  final List<RelatoryViewModel> relatories;

  const RelatoryResultPage({Key? key, required this.relatories})
      : super(key: key);

  @override
  State<RelatoryResultPage> createState() => _RelatoryResultPageState();
}

class _RelatoryResultPageState extends State<RelatoryResultPage> {
  final relatoryStore = GetIt.I<RelatoryStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: TwoActionFABWidget(
        relatories: relatoryStore.relatories,
      ),
      appBar: AppBar(
        title: const Text('Relatório em Tabela'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
            child: DataTable(
          sortColumnIndex: relatoryStore.sortColumnIndex,
          sortAscending: relatoryStore.sortAscending,
          columnSpacing: 0,
          dividerThickness: 5,
          onSelectAll: (bool? isSelected) {
            setState(() {
              if (isSelected != null) {
                widget.relatories.forEach((item) {
                  item.isSelected = isSelected;
                });
              }
            });
          },
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent, width: 3)),
          dataRowColor: MaterialStateColor.resolveWith(
              (Set<MaterialState> states) =>
                  states.contains(MaterialState.selected)
                      ? Colors.blue
                      : Color.fromARGB(100, 215, 217, 219)),
          dataRowHeight: 30,
          dataTextStyle:
              const TextStyle(fontStyle: FontStyle.italic, color: Colors.black),
          headingRowColor: MaterialStateColor.resolveWith(
              (states) => Color.fromARGB(214, 0, 189, 101)),
          headingRowHeight: 50,
          headingTextStyle:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          horizontalMargin: 10,
          showBottomBorder: true,
          showCheckboxColumn: false,
          columns: _createColumns(),
          rows: widget.relatories.map((item) => _createRow(item)).toList(),
        )),
      ),
    );
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(
        label: const Text('Depart.'),
        numeric: false,
        tooltip: 'Departamento ao qual o atendente pertence',
      ),
      DataColumn(
        label: const Text('Atendente'),
        numeric: false,
        tooltip: 'Nome do atendente avaliado',
      ),
      DataColumn(
        label: const Text('Média'),
        numeric: false,
        tooltip:
            'Somatória de pontos de todas as avaliações, dividido pela quantidade total',
      ),
      DataColumn(
        label: const Text('Desempenho'),
        numeric: false,
        tooltip: 'Resultado expresso em 5 categorias',
      ),
      DataColumn(
        label: const Text('Qtd'),
        numeric: false,
        tooltip: 'Total de avaliações no período',
      ),
    ];
  }

  DataRow _createRow(RelatoryViewModel relatory) {
    return DataRow(
      key: ValueKey(relatory.userId + "${DateTime.now()}"),
      selected: relatory.isSelected,
      onSelectChanged: (bool? isSelected) {
        if (isSelected != null) {
          setState(() {
            widget.relatories.forEach((element) {
              if (element.userId == relatory.userId) {
                element.isSelected = isSelected;
              }
            });
          });
        }
      },
      color: MaterialStateColor.resolveWith((Set<MaterialState> states) =>
          states.contains(MaterialState.selected)
              ? Color.fromARGB(255, 252, 105, 94)
              : Color.fromARGB(99, 13, 134, 255)),
      cells: [
        DataCell(
          Text(relatory.departmentName!),
        ),
        DataCell(
          Text(relatory.userName!),
        ),
        DataCell(
          Text(relatory.mediaScores.toString()),
        ),
        DataCell(
          Text(relatory.getPerformanceLevel()),
        ),
        DataCell(
          Text(relatory.totalAvaliations.toString()),
        ),
      ],
    );
  }
}
