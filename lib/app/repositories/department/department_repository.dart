import 'package:avatende/app/models/department_model.dart';
import 'package:avatende/app/models/views/department_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

class DepartmentRepository {
  var _instance = FirebaseFirestore.instance;
  var _collection = 'Departments';

  Future<String> createDepartment(DepartmentModel departmodel) async {
    try {
      FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
      //logica para salvar no banco
      await _instance.collection(_collection).add({
        'Name': departmodel.name,
        'Phone': departmodel.phone,
        'Active': departmodel.active,
        'CompanyId': departmodel.companyId,
        'CreatedAt': DateTime.now(),
      });
      return 'Departamento criado com sucesso!';
    } catch (e) {
      print('Error: $e');
      return 'Erro: Falha ao criar departamento!';
    }
  }

  //lista de Departamentos Ativas
  Observable<Stream<List<DepartmentViewModel>>> departments(
      String companyId, bool listActive, bool orderByAz) {
    print('meu companyId repo: $companyId');

    return Observable(_instance
        .collection(_collection)
        .where("CompanyId", isEqualTo: companyId)
        .where("Active", isEqualTo: listActive)
        .orderBy('Name', descending: !orderByAz)
        .snapshots()
        .map((query) => query.docs
            .map<DepartmentViewModel>(
                (document) => DepartmentViewModel.fromMap(document))
            .toList()));
  }

  Future<bool> updateDepartments(
      {String departmentId, Map<String, dynamic> departmentData}) async {
    try {
      FirebaseAuth.instance.setPersistence(Persistence.LOCAL);

      await _instance
          .collection(_collection)
          .doc(departmentId)
          .update(departmentData);

      return true;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
