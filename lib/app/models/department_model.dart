class DepartmentModel {
  String name;
  String companyId;
  String phone;
  bool active;

  DepartmentModel({
    required this.name,
    required this.companyId,
    required this.phone,
    this.active = false,
  });
}
