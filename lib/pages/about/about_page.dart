import 'package:avatende/components/custom_drawer/custom_drawer.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Sobre'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 10.0),
                Text(
                  'AvAtende',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  "O designer e ilustrações deste App AvAtende foi criado por Alunos do 4º período do Curso de Gestão da Tecnologia da Informação (GTI) na Faculdade Adventista da Bahia (FADBA).",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 100),
                Image.asset(
                  "images/icon.png",
                  filterQuality: FilterQuality.high,
                  height: 145,
                  width: 145,
                ),
                SizedBox(height: 100),
                Text(
                  "Desenvolvido por:",
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 24,
                  ),
                ),
                Text(
                  "\nJodaías Barreto, Marcos Feitosa.",
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  "Contato:",
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 24,
                  ),
                ),
                Text(
                  "\njodaias2013@gmail.com",
                  style: TextStyle(
                    /*marcosfeitosa819@gmail.com*/
                    color: Colors.grey[800],
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
