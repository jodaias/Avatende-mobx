import 'package:cloud_firestore/cloud_firestore.dart';

class CompanyViewModel {
  String _companyId;
  String name;
  String address;
  bool active;
  String phone;

  CompanyViewModel();

  CompanyViewModel.fromMap(DocumentSnapshot document) {
    _companyId = document.id;
    this.name = document.data()["Name"];
    this.active = document.data()["Active"] ?? false;
    this.address = document.data()["Address"];
    this.phone = document.data()["Phone"];
  }

  toMap() {
    var map = new Map<String, dynamic>();
    map['Name'] = this.name;
    map['Active'] = this.active;
    map['Phone'] = this.phone;
    map['Address'] = this.address;
    return map;
  }

  String companyId() => _companyId;
}
