import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:share_extend/share_extend.dart';

class EXCELViewerPage extends StatefulWidget {
  EXCELViewerPage(this.path);

  final String path;

  @override
  _EXCELViewerPageState createState() => _EXCELViewerPageState();
}

class _EXCELViewerPageState extends State<EXCELViewerPage> {
  PDFDocument _doc;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _initExcel();
  }

  _initExcel() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Relatório em EXCEL'),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                  onPressed: () {
                    ShareExtend.share(widget.path, "file",
                        sharePanelTitle: "Enviar EXCEL",
                        subject: "relatory-excel");
                  }),
            )
          ],
        ),
        body: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : PDFViewer(document: _doc));
  }
}
