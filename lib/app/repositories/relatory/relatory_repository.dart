import 'package:avatende/app/models/avaliation_model.dart';
import 'package:avatende/app/models/views/appraiser_data_view_model.dart';
import 'package:avatende/app/models/views/relatory_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RelatoryRepository {
  var _instance = FirebaseFirestore.instance;

  Future<RelatoryViewModel?> filterRelatoryByUserAndRangeDate(String userId,
      DateTime startDate, DateTime endDate, bool userActive) async {
    //filtra as avalizações de um só usuario;
    var avaliations = <AvaliationModel>[];
    endDate = endDate.add(Duration(hours: 59, minutes: 59, seconds: 59));

    var snapshots = await _instance
        .collection("Users")
        .doc(userId)
        .collection("Avaliations")
        .get();

    for (var item in snapshots.docs) {
      Timestamp timestamp = item.data()["CreatedAt"];

      var date =
          DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);

      print('Start: $startDate\nEndDate: $endDate');

      //comparação de datas
      if (date.isAfter(startDate) && date.isBefore(endDate)) {
        var avaliation = new AvaliationModel.fromMap(item.data());
        avaliations.add(avaliation);
      }
    }

    double mediaScores = 0;
    double somaScores = 0;
    var observations = <String?>[];
    var contacts = <String?>[];

    avaliations.forEach((avaliation) {
      somaScores += avaliation.scores;

      if (avaliation.email != null) {
        contacts.add(avaliation.email);
      }

      if (avaliation.observation != null) {
        //add na lista de observações do usuário atendente
        observations.add(avaliation.observation);
      }
    });

    if (avaliations.isNotEmpty) {
      var appraiserData = new AppraiserDataViewModel(
          contacts: contacts, observations: observations);

      mediaScores = somaScores / avaliations.length;

      var relatory = new RelatoryViewModel(
          userId: userId,
          mediaScores: double.parse(mediaScores.toStringAsFixed(2)),
          appraiserData: appraiserData,
          totalAvaliations: avaliations.length);

      return relatory;
    }
    return null;
  }
}
