import 'dart:io';

import 'package:avatende/app/enums/user-type.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserViewModel {
  late String _userId;
  late String? name;
  late String? email;
  // late String phone;
  // late String address;
  late String? departmentId;
  late String? companyId;
  late bool active = false;
  late UserType userType = UserType.User;
  late String? image;
  late File? imageFile;

  UserViewModel();

  UserViewModel.fromMap(Map<String, dynamic> document) {
    _userId = document['UserId'];
    this.name = document['Name'] ?? "";
    this.userType = UserType.values[document['UserType']];
    this.userType == UserType.Admin
        ? this.companyId = document['CompanyId']
        : this.companyId = null;
    this.userType == UserType.User
        ? this.departmentId = document['DepartmentId']
        : this.departmentId = null;
    this.active = document['Active'] ?? false;
    this.email = document['Email'] ?? "";
    this.image = document['Image'] ?? "";
  }

  toMap() {
    var map = new Map<String, dynamic>();
    map['Name'] = this.name;
    map['Active'] = this.active;
    map['DepartmentId'] = this.departmentId;
    map['Email'] = this.email;
    map['UserType'] = this.userType.index;
    map['Image'] = this.image;
    map['CompanyId'] = this.companyId;
    map['UserId'] = this.userId();
    return map;
  }

  String? userId() => _userId;
}
