import 'package:avatende/app/models/department_model.dart';
import 'package:avatende/app/models/views/department_view_model.dart';
import 'package:avatende/app/pages/stores/notification/notification_store.dart';
import 'package:avatende/app/repositories/user/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class DepartmentRepository {
  var _instance = FirebaseFirestore.instance;
  var _userRepository = new UserRepository();
  final notificationStore = GetIt.I<NotificationStore>();
  var _collection = 'Departments';

  Future<String> createDepartment(DepartmentModel departmodel) async {
    try {
      //logica para salvar no banco
      await _instance.collection(_collection).add({
        'Id': '',
        'Name': departmodel.name,
        'Phone': departmodel.phone,
        'Active': departmodel.active,
        'CompanyId': departmodel.companyId,
        'CreatedAt': DateTime.now(),
      });
      notificationStore.setMessage('Departamento criado com sucesso!');
      return 'Departamento criado com sucesso!';
    } catch (e) {
      notificationStore.setMessage('Erro: Falha ao criar departamento!');
      return 'Erro: Falha ao criar departamento!';
    }
  }

  //lista de Departamentos Ativas
  Future<List<DepartmentViewModel>> getDepartments(String companyId,
      {bool listActive = true, bool orderByAz = true}) async {
    var snapshots = await _instance
        .collection(_collection)
        .where("CompanyId", isEqualTo: companyId)
        .where("Active", isEqualTo: listActive)
        .orderBy('Name', descending: !orderByAz)
        .get();

    var departments = snapshots.docs
        .map((doc) => DepartmentViewModel.fromMap(doc.data(), doc.id))
        .toList();

    //Atribui a lista de users para cada departamento
    for (var department in departments) {
      department.users = await _userRepository.filterUsersByDepartment(
          department.departmentId(), true);
    }

    return departments;
  }

  //lista de Departamentos Ativas
  Observable<Stream<List<DepartmentViewModel>>> departments(
      String companyId, bool listActive, bool orderByAz) {
    return Observable(_instance
        .collection(_collection)
        .where("CompanyId", isEqualTo: companyId)
        .where("Active", isEqualTo: listActive)
        .orderBy('Name', descending: !orderByAz)
        .snapshots()
        .map((query) => query.docs
            .map<DepartmentViewModel>((document) =>
                DepartmentViewModel.fromMap(document.data(), document.id))
            .toList()));
  }

  Future<bool> updateDepartments(
      {required String departmentId,
      required Map<String, dynamic> departmentData}) async {
    try {
      await _instance
          .collection(_collection)
          .doc(departmentId)
          .update(departmentData);
      notificationStore.setMessage('Departamento atualizado com sucesso!');

      return true;
    } catch (e) {
      notificationStore.setMessage('Falha na atualização do departamento!');
      return false;
    }
  }
}
