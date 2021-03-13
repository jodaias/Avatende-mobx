class UserModel {
  String name;
  String email;
  String phone;
  String departmentId;
  String companyId;
  String address;
  bool active;
  String userType;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.address,
    this.active,
    this.userType,
    this.departmentId,
    this.companyId,
  });
}
