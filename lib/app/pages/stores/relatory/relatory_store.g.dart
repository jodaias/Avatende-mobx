// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relatory_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RelatoryStore on _RelatoryStoreBase, Store {
  Computed<Function> _$generatePressedComputed;

  @override
  Function get generatePressed => (_$generatePressedComputed ??=
          Computed<Function>(() => super.generatePressed,
              name: '_RelatoryStoreBase.generatePressed'))
      .value;
  Computed<bool> _$showAttendantsComputed;

  @override
  bool get showAttendants =>
      (_$showAttendantsComputed ??= Computed<bool>(() => super.showAttendants,
              name: '_RelatoryStoreBase.showAttendants'))
          .value;
  Computed<bool> _$showDepartmentsComputed;

  @override
  bool get showDepartments =>
      (_$showDepartmentsComputed ??= Computed<bool>(() => super.showDepartments,
              name: '_RelatoryStoreBase.showDepartments'))
          .value;
  Computed<bool> _$showTypeReportSelectComputed;

  @override
  bool get showTypeReportSelect => (_$showTypeReportSelectComputed ??=
          Computed<bool>(() => super.showTypeReportSelect,
              name: '_RelatoryStoreBase.showTypeReportSelect'))
      .value;

  final _$loadingAtom = Atom(name: '_RelatoryStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$selectedStartDateAtom =
      Atom(name: '_RelatoryStoreBase.selectedStartDate');

  @override
  DateTime get selectedStartDate {
    _$selectedStartDateAtom.reportRead();
    return super.selectedStartDate;
  }

  @override
  set selectedStartDate(DateTime value) {
    _$selectedStartDateAtom.reportWrite(value, super.selectedStartDate, () {
      super.selectedStartDate = value;
    });
  }

  final _$dateRangeAtom = Atom(name: '_RelatoryStoreBase.dateRange');

  @override
  DateTimeRange get dateRange {
    _$dateRangeAtom.reportRead();
    return super.dateRange;
  }

  @override
  set dateRange(DateTimeRange value) {
    _$dateRangeAtom.reportWrite(value, super.dateRange, () {
      super.dateRange = value;
    });
  }

  final _$selectedEndDateAtom =
      Atom(name: '_RelatoryStoreBase.selectedEndDate');

  @override
  DateTime get selectedEndDate {
    _$selectedEndDateAtom.reportRead();
    return super.selectedEndDate;
  }

  @override
  set selectedEndDate(DateTime value) {
    _$selectedEndDateAtom.reportWrite(value, super.selectedEndDate, () {
      super.selectedEndDate = value;
    });
  }

  final _$typeReportSelectedAtom =
      Atom(name: '_RelatoryStoreBase.typeReportSelected');

  @override
  TypeRelatory get typeReportSelected {
    _$typeReportSelectedAtom.reportRead();
    return super.typeReportSelected;
  }

  @override
  set typeReportSelected(TypeRelatory value) {
    _$typeReportSelectedAtom.reportWrite(value, super.typeReportSelected, () {
      super.typeReportSelected = value;
    });
  }

  final _$userSelectedAtom = Atom(name: '_RelatoryStoreBase.userSelected');

  @override
  UserViewModel get userSelected {
    _$userSelectedAtom.reportRead();
    return super.userSelected;
  }

  @override
  set userSelected(UserViewModel value) {
    _$userSelectedAtom.reportWrite(value, super.userSelected, () {
      super.userSelected = value;
    });
  }

  final _$departmentSelectedAtom =
      Atom(name: '_RelatoryStoreBase.departmentSelected');

  @override
  DepartmentViewModel get departmentSelected {
    _$departmentSelectedAtom.reportRead();
    return super.departmentSelected;
  }

  @override
  set departmentSelected(DepartmentViewModel value) {
    _$departmentSelectedAtom.reportWrite(value, super.departmentSelected, () {
      super.departmentSelected = value;
    });
  }

  final _$relatoriesAtom = Atom(name: '_RelatoryStoreBase.relatories');

  @override
  List<RelatoryViewModel> get relatories {
    _$relatoriesAtom.reportRead();
    return super.relatories;
  }

  @override
  set relatories(List<RelatoryViewModel> value) {
    _$relatoriesAtom.reportWrite(value, super.relatories, () {
      super.relatories = value;
    });
  }

  final _$departmentsAtom = Atom(name: '_RelatoryStoreBase.departments');

  @override
  List<DepartmentViewModel> get departments {
    _$departmentsAtom.reportRead();
    return super.departments;
  }

  @override
  set departments(List<DepartmentViewModel> value) {
    _$departmentsAtom.reportWrite(value, super.departments, () {
      super.departments = value;
    });
  }

  final _$attendantsAtom = Atom(name: '_RelatoryStoreBase.attendants');

  @override
  List<UserViewModel> get attendants {
    _$attendantsAtom.reportRead();
    return super.attendants;
  }

  @override
  set attendants(List<UserViewModel> value) {
    _$attendantsAtom.reportWrite(value, super.attendants, () {
      super.attendants = value;
    });
  }

  final _$sortColumnIndexAtom =
      Atom(name: '_RelatoryStoreBase.sortColumnIndex');

  @override
  int get sortColumnIndex {
    _$sortColumnIndexAtom.reportRead();
    return super.sortColumnIndex;
  }

  @override
  set sortColumnIndex(int value) {
    _$sortColumnIndexAtom.reportWrite(value, super.sortColumnIndex, () {
      super.sortColumnIndex = value;
    });
  }

  final _$sortAscendingAtom = Atom(name: '_RelatoryStoreBase.sortAscending');

  @override
  bool get sortAscending {
    _$sortAscendingAtom.reportRead();
    return super.sortAscending;
  }

  @override
  set sortAscending(bool value) {
    _$sortAscendingAtom.reportWrite(value, super.sortAscending, () {
      super.sortAscending = value;
    });
  }

  final _$generatedReportAtom =
      Atom(name: '_RelatoryStoreBase.generatedReport');

  @override
  bool get generatedReport {
    _$generatedReportAtom.reportRead();
    return super.generatedReport;
  }

  @override
  set generatedReport(bool value) {
    _$generatedReportAtom.reportWrite(value, super.generatedReport, () {
      super.generatedReport = value;
    });
  }

  final _$getRelatoryByAttendantAsyncAction =
      AsyncAction('_RelatoryStoreBase.getRelatoryByAttendant');

  @override
  Future<void> getRelatoryByAttendant(String userId, DateTime startDate,
      DateTime endDate, String departName, String userName,
      {bool userActive = true}) {
    return _$getRelatoryByAttendantAsyncAction.run(() => super
        .getRelatoryByAttendant(
            userId, startDate, endDate, departName, userName,
            userActive: userActive));
  }

  final _$getRelatoryByDepartmentAsyncAction =
      AsyncAction('_RelatoryStoreBase.getRelatoryByDepartment');

  @override
  Future<void> getRelatoryByDepartment() {
    return _$getRelatoryByDepartmentAsyncAction
        .run(() => super.getRelatoryByDepartment());
  }

  final _$getRelatoryByDepartmentsAsyncAction =
      AsyncAction('_RelatoryStoreBase.getRelatoryByDepartments');

  @override
  Future<void> getRelatoryByDepartments() {
    return _$getRelatoryByDepartmentsAsyncAction
        .run(() => super.getRelatoryByDepartments());
  }

  final _$getDepartmentsAsyncAction =
      AsyncAction('_RelatoryStoreBase.getDepartments');

  @override
  Future<void> getDepartments() {
    return _$getDepartmentsAsyncAction.run(() => super.getDepartments());
  }

  final _$getAttendantsAsyncAction =
      AsyncAction('_RelatoryStoreBase.getAttendants');

  @override
  Future<void> getAttendants(String departmentId) {
    return _$getAttendantsAsyncAction
        .run(() => super.getAttendants(departmentId));
  }

  final _$generateReportAsyncAction =
      AsyncAction('_RelatoryStoreBase.generateReport');

  @override
  Future<void> generateReport() {
    return _$generateReportAsyncAction.run(() => super.generateReport());
  }

  final _$_RelatoryStoreBaseActionController =
      ActionController(name: '_RelatoryStoreBase');

  @override
  void setSortColumnIndex(int value) {
    final _$actionInfo = _$_RelatoryStoreBaseActionController.startAction(
        name: '_RelatoryStoreBase.setSortColumnIndex');
    try {
      return super.setSortColumnIndex(value);
    } finally {
      _$_RelatoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSortAscending(bool value) {
    final _$actionInfo = _$_RelatoryStoreBaseActionController.startAction(
        name: '_RelatoryStoreBase.setSortAscending');
    try {
      return super.setSortAscending(value);
    } finally {
      _$_RelatoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_RelatoryStoreBaseActionController.startAction(
        name: '_RelatoryStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_RelatoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGeneratedReport(bool value) {
    final _$actionInfo = _$_RelatoryStoreBaseActionController.startAction(
        name: '_RelatoryStoreBase.setGeneratedReport');
    try {
      return super.setGeneratedReport(value);
    } finally {
      _$_RelatoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedStartDate(DateTime value) {
    final _$actionInfo = _$_RelatoryStoreBaseActionController.startAction(
        name: '_RelatoryStoreBase.setSelectedStartDate');
    try {
      return super.setSelectedStartDate(value);
    } finally {
      _$_RelatoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedEndDate(DateTime value) {
    final _$actionInfo = _$_RelatoryStoreBaseActionController.startAction(
        name: '_RelatoryStoreBase.setSelectedEndDate');
    try {
      return super.setSelectedEndDate(value);
    } finally {
      _$_RelatoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDateRange(DateTimeRange value) {
    final _$actionInfo = _$_RelatoryStoreBaseActionController.startAction(
        name: '_RelatoryStoreBase.setDateRange');
    try {
      return super.setDateRange(value);
    } finally {
      _$_RelatoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTypeReportSelected(TypeRelatory value) {
    final _$actionInfo = _$_RelatoryStoreBaseActionController.startAction(
        name: '_RelatoryStoreBase.setTypeReportSelected');
    try {
      return super.setTypeReportSelected(value);
    } finally {
      _$_RelatoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRelatory(RelatoryViewModel value) {
    final _$actionInfo = _$_RelatoryStoreBaseActionController.startAction(
        name: '_RelatoryStoreBase.setRelatory');
    try {
      return super.setRelatory(value);
    } finally {
      _$_RelatoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getEnumDescription(TypeRelatory typeRelatory) {
    final _$actionInfo = _$_RelatoryStoreBaseActionController.startAction(
        name: '_RelatoryStoreBase.getEnumDescription');
    try {
      return super.getEnumDescription(typeRelatory);
    } finally {
      _$_RelatoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
selectedStartDate: ${selectedStartDate},
dateRange: ${dateRange},
selectedEndDate: ${selectedEndDate},
typeReportSelected: ${typeReportSelected},
userSelected: ${userSelected},
departmentSelected: ${departmentSelected},
relatories: ${relatories},
departments: ${departments},
attendants: ${attendants},
sortColumnIndex: ${sortColumnIndex},
sortAscending: ${sortAscending},
generatedReport: ${generatedReport},
generatePressed: ${generatePressed},
showAttendants: ${showAttendants},
showDepartments: ${showDepartments},
showTypeReportSelect: ${showTypeReportSelect}
    ''';
  }
}
