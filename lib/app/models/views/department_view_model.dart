import 'package:avatende/app/models/views/user_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DepartmentViewModel {
  String _departmentId;
  String name;
  String companyId;
  String phone;
  bool active;
  List<UserViewModel> users;

  DepartmentViewModel();

  DepartmentViewModel.fromMap(DocumentSnapshot document) {
    _departmentId = document.id;
    this.name = document.data()['Name'];
    this.active = document.data()['Active'] ?? false;
    this.phone = document.data()['Phone'];
    this.companyId = document.data()['CompanyId'];
    this.users = document.data()["Users"];
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
