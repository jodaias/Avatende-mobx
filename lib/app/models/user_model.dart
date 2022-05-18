import 'package:avatende/app/enums/user-type.dart';

class UserModel {
  String name;
  String email;
  String? departmentId;
  String? companyId;
  String? image;
  bool active;
  UserType userType;

  UserModel(
      {required this.name,
      required this.email,
      this.active = false,
      this.userType = UserType.User,
      this.departmentId,
      this.companyId,
      this.image});
}
