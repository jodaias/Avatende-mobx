import 'package:avatende/app/models/views/department_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CompanyViewModel {
  late String _companyId;
  late String name;
  late String address;
  late bool active;
  late String phone;
  List<DepartmentViewModel>? departments;

  CompanyViewModel(
      {required this.name,
      required this.address,
      this.active = false,
      required this.phone,
      this.departments});

  CompanyViewModel.fromMap(Map<String, dynamic> document, String id) {
    _companyId = id;
    this.name = document["Name"];
    this.active = document["Active"] ?? false;
    this.phone = document["Phone"];
    this.address = document["Address"];
    this.departments = document["Departments"];
  }

  String? companyId() => _companyId;
}
