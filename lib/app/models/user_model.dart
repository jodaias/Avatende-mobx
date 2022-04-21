import 'package:avatende/app/enums/user-type.dart';

class UserModel {
  String name;
  String email;
  String phone;
  String departmentId;
  String companyId;
  String address;
  String image;
  bool active;
  UserType userType;

  UserModel(
      {this.name,
      this.email,
      this.phone,
      this.address,
      this.active,
      this.userType,
      this.departmentId,
      this.companyId,
      this.image});
}
