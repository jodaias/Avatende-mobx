import 'package:avatende/models/department_model.dart';
import 'package:avatende/models/views/department_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

class DepartmentRepository {
  var _auth = FirebaseAuth.instance;
  var _instance = FirebaseFirestore.instance;
  var _collection;

  Future<String> createDepartment(DepartmentModel departmodel) async {
    try {
      if (_auth.currentUser.email != 'empresa@empresa.com') {
        _collection = 'Departments';
      } else {
        _collection = 'DepartmentsDev';
      }
      //logica para salvar no banco
      await _instance.collection(_collection).add({
        'Name': departmodel.name,
        'Phone': departmodel.phone,
        'Active': departmodel.active,
        'CompanyId': departmodel.companyId,
      });
      return 'Departamento criado com sucesso!';
    } catch (e) {
      print('Error: $e');
      return 'Erro: Falha ao criar departamento!';
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

  //lista de Departamentos Ativas
  Observable<Stream<List<DepartmentViewModel>>> get departmentsActives {
    if (_auth.currentUser.email != 'empresa@empresa.com') {
      _collection = 'Departments';
    } else {
      _collection = 'DepartmentsDev';
    }
    return Observable(_instance
        .collection(_collection)
        .where("Active", isEqualTo: true)
        .snapshots()
        .map((query) => query.docs
            .map<DepartmentViewModel>(
                (document) => DepartmentViewModel.fromMap(document))
            .toList()));
  }

  //lista de Departamentos Inativas
  Observable<Stream<List<DepartmentViewModel>>> get departmentsInactives {
    if (_auth.currentUser.email != 'empresa@empresa.com') {
      _collection = 'Departments';
    } else {
      _collection = 'DepartmentsDev';
    }

    return Observable(_collection
        .where("Active", isEqualTo: false)
        .snapshots()
        .map((query) => query.docs
            .map<DepartmentViewModel>(
                (document) => DepartmentViewModel.fromMap(document))
            .toList()));
  }
}
