import 'dart:io';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:share_extend/share_extend.dart';

class PDFViewerPage extends StatefulWidget {
  PDFViewerPage(this.path, this.file);

  final String path;
  final File file;

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  PDFDocument _doc;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _initPdf();
  }

  _initPdf() async {
    setState(() {
      _loading = true;
    });
    PDFDocument doc;
    if (Platform.isAndroid) {
      doc = await PDFDocument.fromFile(widget.file);
    } else {
      doc = await PDFDocument.fromAsset(widget.path);
    }

    setState(() {
      _doc = doc;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Relatório em PDF'),
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
                        sharePanelTitle: "Enviar PDF", subject: "relatory-pdf");
                  }),
            )
          ],
        ),
        body: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : PDFViewer(
                document: _doc,
                tooltip: _setTollTipViewer(),
              ));
  }

  _setTollTipViewer() {
    return PDFViewerTooltip(
        first: "Primeira",
        previous: "Anterior",
        next: "Próximo",
        last: "Última",
        pick: "Escolha uma Página",
        jump: "Pular");
  }
}
