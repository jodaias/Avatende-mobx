import 'package:cloud_firestore/cloud_firestore.dart';

class DepartmentViewModel {
  String _departmentId;
  String name;
  String companyId;
  String phone;
  bool active;

  DepartmentViewModel();

  DepartmentViewModel.fromMap(DocumentSnapshot document) {
    _departmentId = document.id;
    this.name = document.data()['Name'];
    this.active = document.data()['Active'] ?? false;
    this.phone = document.data()['Phone'];
    this.companyId = document.data()['CompanyId'];
  }

  toMap() {
    var map = new Map<String, dynamic>();
    map['Name'] = this.name;
    map['Active'] = this.active;
    map['Phone'] = this.phone;
    map['CompanyId'] = this.companyId;
    map['DepartmentId'] = this.departmentId();
    return map;
  }

  String departmentId() => _departmentId;
}
