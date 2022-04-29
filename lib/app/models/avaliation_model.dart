import 'package:cloud_firestore/cloud_firestore.dart';

class AvaliationModel {
  DateTime createdAt;
  double scores;
  String observation;
  String email;
  String phone;

  AvaliationModel({
    this.createdAt,
    this.scores,
    this.observation,
    this.phone,
    this.email,
  });

  AvaliationModel.fromMap(Map document) {
    this.email = document['Email'];
    this.phone = document['Phone'];
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
