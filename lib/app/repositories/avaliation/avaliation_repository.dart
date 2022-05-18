import 'package:avatende/app/models/views/ads_images_view_model.dart';
import 'package:avatende/app/models/views/user_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

class AvaliationRepository {
  final _instance = FirebaseFirestore.instance;
  var _collection;

  Future<String> saveAvaliation(
      {required UserViewModel userViewModel,
      required Map<String, dynamic> avaliationData}) async {
    _collection = 'Users';

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

  //lista de images
  Observable<Stream<AdsImagesViewModel>> adsImages(String companyId) {
    _collection = "Companys";

    return Observable(_instance
        .collection(_collection)
        .doc(companyId)
        .collection("AdsImages")
        .snapshots()
        .map((query) => query.docs
            .map<AdsImagesViewModel>(
                (document) => AdsImagesViewModel.fromMap(document))
            .first));
  }
}
