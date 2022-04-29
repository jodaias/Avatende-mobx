import 'dart:io';
import 'package:avatende/app/models/views/relatory_view_model.dart';
import 'package:avatende/app/pages/relatory/excel_viewer_page.dart';
import 'package:avatende/app/pages/relatory/pdf_viewer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';

//para o pdf
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

class TwoActionFABWidget extends StatelessWidget {
  final List<RelatoryViewModel> relatories;
  const TwoActionFABWidget({Key key, this.relatories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.print,
      activeIcon: Icons.close,
      iconTheme: IconThemeData(color: Colors.white),
      animatedIconTheme: IconThemeData(size: 22),
      backgroundColor: Color.fromRGBO(14, 37, 130, 0.85),
      visible: true,
      curve: Curves.bounceIn,
      children: [
        // FAB 1
        SpeedDialChild(
          child: Icon(Icons.table_view_rounded),
          backgroundColor: Colors.green,
          onTap: () {
            //TODO: IMPLEMENTAR DOWN EXCEL
            // _createExcel();
          },
          label: 'EXCEL',
          labelStyle: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 16.0),
          labelBackgroundColor: Colors.green[900],
        ),
        // FAB 2
        SpeedDialChild(
          child: Icon(Icons.picture_as_pdf),
          backgroundColor: Colors.red,
          onTap: () {
            var listToConverter = _setListToTable(relatories);

            _createPdf(context: context, listToConverter: listToConverter);
          },
          label: 'PDF',
          labelStyle: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 16.0),
          labelBackgroundColor: Color.fromRGBO(173, 11, 0, 0.85),
        ),
      ],
    );
  }

  List<List<String>> _setListToTable(List<RelatoryViewModel> relatories) {
    var listToReturn = <List<String>>[];
    for (var relatory in relatories) {
      listToReturn.add([
        relatory.departmentName,
        relatory.userName,
        relatory.mediaScores.toString(),
        relatory.getPerformanceLevel(),
        relatory.totalAvaliations.toString()
      ]);
    }
    return listToReturn;
  }

  _createPdf({BuildContext context, List<List<String>> listToConverter}) async {
    final dateGenerate =
        DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.now());

    final pw.Document pdf = pw.Document(deflate: zlib.encode);

    pdf.addPage(pw.MultiPage(build: (context) {
      return [
        pw.Row(children: [
          pw.PdfLogo(),
          pw.Header(
              margin: pw.EdgeInsets.all(5.0),
              outlineColor: PdfColor(0.4, 0.7, 0.8),
              outlineStyle: PdfOutlineStyle.bold,
              padding: pw.EdgeInsets.all(8.0),
              child: pw.Text("RELATÓRIO DE AVALIAÇÕES DOS ATENDENTES",
                  style: pw.TextStyle(
                      fontSize: 18,
                      color: PdfColor(0, 0, 0, 0.5),
                      fontWeight: pw.FontWeight.bold)),
              textStyle: pw.TextStyle(color: PdfColor(0, 0, 0, 0.5))),
        ]),
        pw.Header(
            level: 2,
            margin: pw.EdgeInsets.all(5.0),
            outlineColor: PdfColor(0.4, 0.7, 0.8),
            outlineStyle: PdfOutlineStyle.bold,
            padding: pw.EdgeInsets.all(8.0),
            child: pw.Text("Gerado em: $dateGenerate"),
            textStyle: pw.TextStyle(color: PdfColor(0, 0, 0, 0.5))),
        pw.Table.fromTextArray(
            data: <List<String>>[
                  <String>[
                    "Departamento",
                    "Atendente",
                    "Média de pontos",
                    "Desempenho",
                    "Qtd"
                  ]
                ] +
                listToConverter)
      ];
    }));

    //Salvar o pdf temporariamente para depois buscar
    Directory docDirectory;

    if (Platform.isAndroid) {
      docDirectory = await getExternalStorageDirectory();
    } else {
      docDirectory = await getApplicationDocumentsDirectory();
    }

    final String dir = docDirectory.path;
    final String path = '$dir/report_avaliations_${DateTime.now()}.pdf';

    final File file = File.fromUri(Uri.parse(path));

    file.writeAsBytesSync(await pdf.save());

    //Redirecionar para uma pagina para visualizar o pdf salvo anteriormente
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PDFViewerPage(path, file)));
  }

  _createExcel({BuildContext context, RelatoryViewModel relatory}) async {
    //criar excell

    Directory docDirectory;

    if (Platform.isAndroid) {
      docDirectory = await getExternalStorageDirectory();
    } else {
      docDirectory = await getApplicationDocumentsDirectory();
    }

    final String dir = docDirectory.path;
    final String path = '$dir/report_avaliations_${DateTime.now()}.xlsx';

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => EXCELViewerPage(path)));
  }
}
