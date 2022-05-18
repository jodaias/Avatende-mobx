import 'package:avatende/app/pages/avaliation/acknowledgment_page.dart';
import 'package:avatende/app/pages/signup/components/field_title.dart';
import 'package:avatende/app/pages/stores/avaliation/avaliation_store.dart';
// import 'package:brasil_fields/formatter/telefone_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class ObservationPage extends StatefulWidget {
  final String title;

  const ObservationPage({Key? key, this.title = "Observação"})
      : super(key: key);
  @override
  _ObservationPageState createState() => _ObservationPageState();
}

class _ObservationPageState extends State<ObservationPage> {
  final avaliationStore = GetIt.I<AvaliationStore>();

  late ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    //Zerando variaveis
    avaliationStore.setAnonymous(true);
    avaliationStore.avaliationSuccess = false;

    disposer =
        reaction((_) => avaliationStore.avaliationSuccess, (createdAvaliation) {
      if (createdAvaliation == true) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => AcknowledgmentPage()));
      } else {
        print('Não foi possivel cadastrar');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        leading: Text(''),
      ),
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 32),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 8,
              margin: EdgeInsets.symmetric(horizontal: 32),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Observer(builder: (_) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FieldTitle(
                        title: 'Observação',
                        subtitle: 'Qual sua observação?',
                      ),
                      Observer(builder: (_) {
                        return TextFormField(
                          maxLines: 3,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText:
                                'Digite em poucas palavras o que achou do atendimento',
                            isDense: true,
                            // errorText: avaliationStore.observationError,
                          ),
                          onChanged: avaliationStore.setObservation,
                        );
                      }),
                      avaliationStore.anonymous!
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 16,
                                ),
                                FieldTitle(
                                  title: 'Email',
                                  subtitle: 'Digite seu email',
                                ),
                                Observer(builder: (_) {
                                  return TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      errorText: avaliationStore.emailError,
                                      hintText: 'Exemplo: joão@gmail.com',
                                      isDense: true,
                                    ),
                                    onChanged: avaliationStore.setEmail,
                                    keyboardType: TextInputType.emailAddress,
                                    autocorrect: false,
                                  );
                                }),
                                SizedBox(
                                  height: 16,
                                ),
                              ],
                            )
                          : SizedBox(
                              height: 16,
                            ),
                      FieldTitle(
                        title: 'Anônimo?',
                        subtitle:
                            'Escolha "sim" para avaliação anônima, ou "não" para identificar_se!',
                      ),
                      Observer(builder: (_) {
                        return Row(
                          children: <Widget>[
                            Radio(
                              groupValue: avaliationStore.anonymous,
                              value: true,
                              onChanged: avaliationStore.setAnonymous,
                            ),
                            Text('Sim'),
                            Radio(
                              groupValue: avaliationStore.anonymous,
                              value: false,
                              onChanged: avaliationStore.setAnonymous,
                            ),
                            Text('Não'),
                          ],
                        );
                      }),
                      SizedBox(
                        height: 16,
                      ),
                      Observer(builder: (_) {
                        return Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 20, bottom: 12),
                          height: 40,
                          child: ElevatedButton(
                            child: avaliationStore.loading
                                ? CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                  )
                                : Text('${"ENVIAR AVALIAÇÃO"}'),
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.orange),
                              textStyle: MaterialStateProperty.all(
                                TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: avaliationStore.sendPressed,
                          ),
                        );
                      }),
                    ],
                  );
                }),
              ),
            ),
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
