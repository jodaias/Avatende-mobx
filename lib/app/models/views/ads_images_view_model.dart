import 'package:cloud_firestore/cloud_firestore.dart';

class AdsImagesViewModel {
  late List<String> images = [];
  late String _companyId;

  AdsImagesViewModel();

  AdsImagesViewModel.fromMap(DocumentSnapshot document) {
    this.images = List.from(document['Images']);
    _companyId = document.id;
  }

  toMap() {
    var map = new Map<String, dynamic>();
    map['Images'] = this.images;
    return map;
  }

  String companyId() => _companyId;
}
