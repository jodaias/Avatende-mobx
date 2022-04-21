import 'dart:io';

import 'package:avatende/app/enums/user-type.dart';
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
  UserType userType;
  String image;
  File imageFile;

  UserViewModel();

  UserViewModel.fromMap(DocumentSnapshot document) {
    _userId = document.id;
    this.name = document.data()['Name'];
    this.userType = UserType?.values[document.data()['UserType']];
    this.userType.index >= UserType.Admin.index
        ? this.companyId = document.data()['CompanyId']
        : this.companyId = null;
    this.userType == UserType.User
        ? this.departmentId = document.data()['DepartmentId']
        : this.departmentId = null;
    this.active = document.data()['Active'] ?? false;
    this.email = document.data()['Email'];
    this.phone = document.data()['Phone'];
    this.address = document.data()['Address'];
    setImage(document.data()['Image']);
  }

  setImage(String img) {
    this.image = "";
    if (img != null && img != "") {
      this.image = img;
    }
  }

  toMap() {
    var map = new Map<String, dynamic>();
    map['Name'] = this.name;
    map['Active'] = this.active;
    map['Phone'] = this.phone;
    map['DepartmentId'] = this.departmentId;
    map['Email'] = this.email;
    map['UserType'] = this.userType.index;
    map['Address'] = this.address;
    map['Image'] = this.image;
    map['CompanyId'] = this.companyId;
    map['UserId'] = this.userId();
    return map;
  }

  String userId() => _userId;
}
