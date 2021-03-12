import 'package:cloud_firestore/cloud_firestore.dart';

class DepartmentViewModel {
  String _departmentId;
  String name;
  int companyId;
  String phone;
  bool active;

  DepartmentViewModel();

  DepartmentViewModel.fromMap(DocumentSnapshot document) {
    _departmentId = document.id;
    this.name = document.data()["Name"];
    this.active = document.data()["Active"] ?? false;
    this.phone = document.data()["Phone"];
  }

  toMap() {
    var map = new Map<String, dynamic>();
    map['Name'] = this.name;
    map['Active'] = this.active;
    map['Phone'] = this.phone;
    return map;
  }

  String departmentId() => _departmentId;
}
