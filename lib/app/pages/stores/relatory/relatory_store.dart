import 'package:avatende/app/models/views/department_view_model.dart';
import 'package:avatende/app/models/views/relatory_view_model.dart';
import 'package:avatende/app/models/views/user_view_model.dart';
import 'package:avatende/app/pages/relatory/enums/type_relatory_enum.dart';
import 'package:avatende/app/repositories/department/department_repository.dart';
import 'package:avatende/app/repositories/relatory/relatory_repository.dart';
import 'package:avatende/app/repositories/user/user_repository.dart';
import 'package:avatende/app/storesGlobal/app_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'relatory_store.g.dart';

class RelatoryStore = _RelatoryStoreBase with _$RelatoryStore;

abstract class _RelatoryStoreBase with Store {
  final _relatoryRepository = new RelatoryRepository();
  final _departmentRepository = new DepartmentRepository();
  final _userRepository = new UserRepository();
  final _appStore = GetIt.I<AppStore>();

  @observable
  bool loading = false;

  @observable
  DateTime selectedStartDate;

  @observable
  DateTimeRange dateRange;

  @observable
  DateTime selectedEndDate;

  @observable
  TypeRelatory typeReportSelected;

  @observable
  UserViewModel userSelected;

  @observable
  DepartmentViewModel departmentSelected;

  @observable
  List<RelatoryViewModel> relatories = <RelatoryViewModel>[];

  @observable
  List<DepartmentViewModel> departments = <DepartmentViewModel>[];

  @observable
  List<UserViewModel> attendants = <UserViewModel>[];

  @observable
  int sortColumnIndex = 0;

  @observable
  bool sortAscending = false;

  @observable
  bool generatedReport = false;

  @action
  void setSortColumnIndex(int value) => sortColumnIndex = value;

  @action
  void setSortAscending(bool value) => sortAscending = value;

  @action
  void setLoading(bool value) => loading = value;

  @action
  void setGeneratedReport(bool value) => generatedReport = value;

  @action
  void setSelectedStartDate(DateTime value) => selectedStartDate = value;

  @action
  void setSelectedEndDate(DateTime value) => selectedEndDate = value;

  @action
  void setDateRange(DateTimeRange value) => dateRange = value;

  @action
  void setTypeReportSelected(TypeRelatory value) => typeReportSelected = value;

  @action
  void setRelatory(RelatoryViewModel value) {
    // if (!relatories.contains(value))
    relatories.add(value);
  }

  @action
  Future<void> getRelatoryByAttendant(String userId, DateTime startDate,
      DateTime endDate, String departName, String userName,
      {bool userActive = true}) async {
    var relatory = await _relatoryRepository.filterRelatoryByUserAndRangeDate(
        userId, startDate, endDate, userActive);
    if (relatory != null) {
      relatory.departmentName = departName;
      relatory.userName = userName;
      setRelatory(relatory);
    }
  }

  @action
  Future<void> getRelatoryByDepartment() async {
    if (departmentSelected.users.isNotEmpty || attendants.isNotEmpty) {
      for (var user in departmentSelected.users ?? attendants) {
        await getRelatoryByAttendant(user.userId(), selectedStartDate,
            selectedEndDate, departmentSelected.name, user.name);
      }
    }
  }

  @action
  Future<void> getRelatoryByDepartments() async {
    await getDepartments();

    for (var department in departments) {
      if (department.users.isNotEmpty) {
        for (var user in department.users) {
          await getRelatoryByAttendant(user.userId(), selectedStartDate,
              selectedEndDate, department.name, user.name);
        }
      }
    }
  }

  @action
  String getEnumDescription(TypeRelatory typeRelatory) {
    switch (typeRelatory) {
      case TypeRelatory.alldepartments:
        return "Todos Departamentos";
      case TypeRelatory.department:
        return "Departamento";
      case TypeRelatory.attendant:
        return "Atendente";
      default:
        return "Todos Departamentos";
    }
  }

  @action
  Future<void> getDepartments() async {
    if (departments.isEmpty)
      departments = await _departmentRepository
          .getDepartments(_appStore.companyViewModel.companyId());

    departmentSelected = departments.first;

    var hasUser = departments
        .where((element) => element.users != null && element.users.isNotEmpty)
        .any((_) => true);

    attendants = departments.first.users;
    userSelected = attendants.first;

    if (!hasUser && departments.isNotEmpty) {
      print("Não conseguiu setar os usuários. Result =>: $hasUser");
      await getAttendants(departments.first.departmentId());
    }
  }

  @action
  Future<void> getAttendants(String departmentId) async {
    attendants =
        await _userRepository.filterUsersByDepartment(departmentId, true);
    userSelected = attendants.first;
  }

  @computed
  Function get generatePressed => (selectedStartDate != null &&
              selectedEndDate != null &&
              attendants.isNotEmpty &&
              typeReportSelected != null &&
              !loading ||
          typeReportSelected == TypeRelatory.alldepartments &&
              selectedStartDate != null &&
              selectedEndDate != null)
      ? generateReport
      : null;

  @action
  Future<void> generateReport() async {
    loading = true;

    switch (typeReportSelected) {
      case TypeRelatory.attendant:
        relatories.clear();
        await getRelatoryByAttendant(userSelected.userId(), selectedStartDate,
            selectedEndDate, departmentSelected.name, userSelected.name);

        if (relatories.isNotEmpty) {
          generatedReport = true;
        } else {
          loading = false;
        }
        break;
      case TypeRelatory.department:
        relatories.clear();
        await getRelatoryByDepartment();
        if (relatories.isNotEmpty) {
          generatedReport = true;
        } else {
          loading = false;
        }
        break;
      default:
        relatories.clear();
        await getRelatoryByDepartments();
        if (relatories.isNotEmpty) {
          generatedReport = true;
        } else {
          loading = false;
        }
        break;
    }
  }

  void cleanFieldsSelecteds() {
    typeReportSelected = TypeRelatory.alldepartments;
    selectedStartDate = getInitialDate();
    selectedEndDate = getInitialDate();
    userSelected = null;
    departmentSelected = null;
  }

  @computed
  bool get showAttendants =>
      attendants.isNotEmpty && typeReportSelected == TypeRelatory.attendant;
  @computed
  bool get showDepartments =>
      departments.isNotEmpty &&
      typeReportSelected != TypeRelatory.alldepartments;

  @computed
  bool get showTypeReportSelect =>
      selectedStartDate != null && selectedEndDate != null;

  DateTime getInitialDate() {
    return DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day);
  }
}
