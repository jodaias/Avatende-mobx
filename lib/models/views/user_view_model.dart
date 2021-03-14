import 'package:cloud_firestore/cloud_firestore.dart';

class UserViewModel {
  String _userId;
  String name;
  String email;
  String phone;
  String address;
  String departmentId;
  String companyId;
  bool active;
  String userType;

  UserViewModel();

  UserViewModel.fromMap(DocumentSnapshot document) {
    _userId = document.id;
    this.name = document.data()['Name'];
    document.data()['UserType'].toString().contains('2')
        ? this.companyId = document.data()['CompanyId']
        : this.companyId = null;
    document.data()['UserType'].toString().contains('3')
        ? this.departmentId = document.data()['DepartmentId']
        : this.departmentId = null;
    this.active = document.data()['Active'] ?? false;
    this.email = document.data()['Email'];
    this.phone = document.data()['Phone'];
    this.userType = document.data()['UserType'];
    this.address = document.data()['Address'];
  }

  toMap() {
    var map = new Map<String, dynamic>();
    map['Name'] = this.name;
    map['Active'] = this.active;
    map['Phone'] = this.phone;
    map['DepartmentId'] = this.departmentId;
    map['Email'] = this.email;
    map['UserType'] = this.userType;
    map['Address'] = this.address;
    map['CompanyId'] = this.companyId;
    map['UserId'] = this.userId();
    return map;
  }

  String userId() => _userId;
}
