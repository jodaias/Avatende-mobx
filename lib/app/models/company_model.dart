import 'package:avatende/app/models/views/company_view_model.dart';

class CompanyModel {
  late String name;
  late String address;
  late bool active;
  late String phone;

  CompanyModel({
    required this.name,
    required this.address,
    this.active = false,
    required this.phone,
  });

  toMap() {
    var map = new Map<String, dynamic>();
    map['Name'] = this.name;
    map['Active'] = this.active;
    map['Phone'] = this.phone;
    map['Address'] = this.address;
    map['UpdatedAt'] = DateTime.now();
    return map;
  }

  CompanyModel.mapperFromCompanyViewModel(CompanyViewModel companyViewModel) {
    this.name = companyViewModel.name;
    this.address = companyViewModel.address;
    this.active = companyViewModel.active;
    this.phone = companyViewModel.phone;
  }
}
