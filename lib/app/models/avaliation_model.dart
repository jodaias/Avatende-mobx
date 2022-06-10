import 'package:cloud_firestore/cloud_firestore.dart';

class AvaliationModel {
  late DateTime createdAt;
  late double scores;
  String? observation;
  String? email;

  AvaliationModel({
    required this.createdAt,
    required this.scores,
    this.observation,
    this.email,
  });

  AvaliationModel.fromMap(Map document) {
    this.createdAt = setCreatedAt(document['CreatedAt']);
    this.scores = checkDouble(document['Scores']);
    this.email = document['Email'];
    this.observation = document['Observation'];
  }

  setCreatedAt(Timestamp timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(
        timestamp.millisecondsSinceEpoch);
  }

  double checkDouble(dynamic value) {
    return double.parse(value.toString());
  }
}
