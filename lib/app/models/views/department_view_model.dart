import 'package:avatende/app/models/views/user_view_model.dart';

class DepartmentViewModel {
  late String _departmentId;
  late String name;
  late String companyId;
  late String phone;
  late bool active;
  late List<UserViewModel>? users;

  DepartmentViewModel();

  DepartmentViewModel.fromMap(Map<String, dynamic> document, String id) {
    _departmentId = id;
    this.name = document['Name'];
    this.active = document['Active'] ?? false;
    this.phone = document['Phone'];
    this.companyId = document['CompanyId'];
    this.users = document["Users"];
  }

  toMap() {
    var map = new Map<String, dynamic>();
    map['Name'] = this.name;
    map['Active'] = this.active;
    map['Phone'] = this.phone;
    map['CompanyId'] = this.companyId;
    return map;
  }

  String departmentId() => _departmentId;
}
