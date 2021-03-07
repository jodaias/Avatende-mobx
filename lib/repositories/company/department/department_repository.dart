import 'package:avatende/models/department_model.dart';
import 'package:avatende/models/views/department_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DepartmentRepository {
  CollectionReference _collection =
      FirebaseFirestore.instance.collection('Departments');

  Future<DepartmentViewModel> createDepartment(
      DepartmentModel departmodel) async {
    try {
      //logica para salvar no banco
      _collection.add({
        'Name': departmodel.name,
        'Phone': departmodel.phone,
        'Active': departmodel.active,
        'CompanyId': departmodel.companyId,
      }).then((value) {
        value.get().then((value) {
          return DepartmentViewModel(
            departmentId: value.id,
            name: value.data()["Name"],
            phone: value.data()["Phone"],
            active: value.data()["Active"],
            companyId: value.data()["CompanyId"],
          );
        });
      });
    } catch (e) {
      print('Error: $e');
      return DepartmentViewModel();
    }
  }

  Future<List<DepartmentViewModel>> departmentsList() async {
    List<DepartmentViewModel> departments = [];

    try {
      //logica de trazer os departamentos e salvar na lista departments

      return departments;
    } catch (e) {
      print('Error: $e');
    }
    return departments;
  }
}
