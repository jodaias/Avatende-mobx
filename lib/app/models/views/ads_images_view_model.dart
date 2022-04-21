import 'package:cloud_firestore/cloud_firestore.dart';

class AdsImagesViewModel {
  List<String> images = [];
  String _companyId;

  AdsImagesViewModel();

  AdsImagesViewModel.fromMap(DocumentSnapshot document) {
    this.images = List.from(document.data()['Images']);
    _companyId = document.id;
  }

  toMap() {
    var map = new Map<String, dynamic>();
    map['Images'] = this.images;
    return map;
  }

  String companyId() => _companyId;
}
