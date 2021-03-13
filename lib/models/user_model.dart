class UserModel {
  String name;
  String email;
  String phone;
  String departmentId;
  String companyId;
  bool active;
  String userType;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.active,
    this.userType,
    this.departmentId,
    this.companyId,
  });
}
