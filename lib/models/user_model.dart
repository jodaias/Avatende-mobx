class UserModel {
  String name;
  String email;
  String password;
  String phone;
  int departmentId;
  bool active;
  String userType;

  UserModel({
    this.name,
    this.email,
    this.password,
    this.phone,
    this.departmentId,
    this.active,
    this.userType,
  });
}
