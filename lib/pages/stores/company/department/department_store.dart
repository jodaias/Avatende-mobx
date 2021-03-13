import 'package:avatende/models/views/department_view_model.dart';
import 'package:avatende/repositories/company/department/department_repository.dart';
import 'package:mobx/mobx.dart';
part 'department_store.g.dart';

enum ActivesOrOrderByDepartment {
  actives,
  inactives,
  // orderByAZ,
  // orderByZA,
}

class DepartmentStore = _DepartmentStoreBase with _$DepartmentStore;

abstract class _DepartmentStoreBase with Store {
  //REPOSITÓRIO
  final repository = DepartmentRepository();

  //OBSERVABLES
  @observable
  bool loading = false;

  // @observable
  // bool orderByAz = true;

  @observable
  bool listActive = true;

  @observable
  String companyId;

  //ACTIONS
  @action
  void setCompanyId(String value) => companyId = value;

  // @action
  // void setOrderByAz(bool value) => orderByAz = value;

  @action
  void setListActive(bool value) => listActive = value;

  void activeOrOrderList(ActivesOrOrderByDepartment result) {
    switch (result) {
      case ActivesOrOrderByDepartment.actives:
        setListActive(true);
        break;
      case ActivesOrOrderByDepartment.inactives:
        setListActive(false);
        break;
      // case ActivesOrOrderByDepartment.orderByAZ:
      //   setOrderByAz(true);
      //   break;
      // case ActivesOrOrderByDepartment.orderByZA:
      //   setOrderByAz(false);
      //   break;
    }
  }

  //COMPUTEDS
  @computed
  get departmentList => repository.departmentsActives(companyId).value;

  @computed
  get departmentListInactive =>
      repository.departmentsInactives(companyId).value;
}
