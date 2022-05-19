import 'package:avatende/app/models/views/ads_images_view_model.dart';
import 'package:avatende/app/models/views/user_view_model.dart';
import 'package:avatende/app/pages/stores/notification/notification_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class AvaliationRepository {
  final _instance = FirebaseFirestore.instance;
  final notificationStore = GetIt.I<NotificationStore>();

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
      notificationStore.setMessage('Avaliação registrada com sucesso!');
      return 'Avaliação cadastrada com sucesso';
    } catch (e) {
      notificationStore.setMessage(
          'Erro!\nNão foi possível registrar sua avaliação.\nPor favor, tente novamente!');
      return 'Falha ao registrar avaliação';
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
