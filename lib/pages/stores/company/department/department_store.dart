import 'package:avatende/models/views/department_view_model.dart';
import 'package:avatende/repositories/company/department/department_repository.dart';
import 'package:mobx/mobx.dart';
part 'department_store.g.dart';

enum ActivesOrOrderByDepartment {
  actives,
  inactives,
  orderByAZ,
  orderByZA,
}

class DepartmentStore = _DepartmentStoreBase with _$DepartmentStore;

abstract class _DepartmentStoreBase with Store {
  //REPOSITÓRIO
  final repository = DepartmentRepository();

  //OBSERVABLES
  @observable
  bool loading = false;

  @observable
  bool orderByAz = true;

  @observable
  bool listActive = true;
  @observable
  List<DepartmentViewModel> departmentList = [];

  @observable
  List<DepartmentViewModel> departmentListInactive = [];

  //ACTIONS
  @action
  void setOrderByAz(bool value) => orderByAz = value;

  @action
  void setListActive(bool value) => listActive = value;

  @action
  setDepartmentList(List<DepartmentViewModel> value) => departmentList = value;

  @action
  setDepartmentListInactive(List<DepartmentViewModel> value) =>
      departmentListInactive = value;

  @action
  List<DepartmentViewModel> listDepartments() {
    loading = true;

    repository.departmentsList().then((value) {
      cleanLists();
      value.forEach((element) {
        if (element.active) {
          print('passou aqui');
          departmentList.add(element);
        } else {
          departmentListInactive.add(element);
        }
      });
      departmentListInactive.forEach((element) {
        print(listActive);
      });
    }).catchError((error) {
      loading = false;
      print("Error01: $error");
    });

    if (listActive) {
      return departmentList;
    } else {
      return departmentListInactive;
    }
  }

  void cleanLists() {
    setDepartmentList(new List<DepartmentViewModel>());
    setDepartmentListInactive(new List<DepartmentViewModel>());
  }

  void activeOrOrderList(ActivesOrOrderByDepartment result) {
    switch (result) {
      case ActivesOrOrderByDepartment.actives:
        setListActive(true);
        break;
      case ActivesOrOrderByDepartment.inactives:
        setListActive(false);
        break;
      case ActivesOrOrderByDepartment.orderByAZ:
        setOrderByAz(true);
        break;
      case ActivesOrOrderByDepartment.orderByZA:
        setOrderByAz(false);
        break;
    }
  }

  //COMPUTEDS
}
