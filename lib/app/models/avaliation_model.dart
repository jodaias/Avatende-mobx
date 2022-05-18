import 'package:cloud_firestore/cloud_firestore.dart';

class AvaliationModel {
  DateTime? createdAt;
  late double scores;
  late String observation;
  late String email;

  AvaliationModel({
    this.createdAt,
    required this.scores,
    required this.observation,
    required this.email,
  });

  AvaliationModel.fromMap(Map document) {
    this.email = document['Email'];
    this.createdAt = setCreatedAt(document['CreatedAt']);
    this.scores = checkDouble(document['Scores']);
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
