import 'package:avatende/models/views/user_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AvaliationRepository {
  var _auth = FirebaseAuth.instance;
  var _instance = FirebaseFirestore.instance;
  var _collection;

  Future<String> saveAvaliation(
      {UserViewModel userViewModel,
      Map<String, dynamic> avaliationData}) async {
    if (userViewModel.userType == 'Atendente') {
      _collection = 'Users';
    } else {
      _collection = 'UsersDev';
    }

    try {
      await _instance
          .collection(_collection)
          .doc(userViewModel.userId())
          .collection('Avaliations')
          .add(avaliationData);

      return 'Avaliação cadastrada com sucesso';
    } catch (e) {
      return 'Falha ao cadastrar avaliação';
    }
  }
}
