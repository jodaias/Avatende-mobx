import 'package:avatende/repositories/company/company_repository.dart';
import 'package:mobx/mobx.dart';
part 'company_store.g.dart';

enum ActivesOrOrderByCompany {
  actives,
  inactives,
  orderByAZ,
  orderByZA,
}

class CompanyStore = _CompanyStoreBase with _$CompanyStore;

abstract class _CompanyStoreBase with Store {
  //REPOSITÓRIO
  var repository = new CompanyRepository();

  //OBSERVABLES
  @observable
  bool loading = false;

  @observable
  bool orderByAz = true;

  @observable
  bool listActive = true;

  //ACTIONS
  @action
  void setOrderByAz(bool value) => orderByAz = value;

  @action
  void setListActive(bool value) => listActive = value;

  void activeOrOrderList(ActivesOrOrderByCompany result) {
    switch (result) {
      case ActivesOrOrderByCompany.actives:
        setListActive(true);
        break;
      case ActivesOrOrderByCompany.inactives:
        setListActive(false);
        break;
      // case ActivesOrOrderByCompany.orderByAZ:
      //   setOrderByAz(true);
      //   break;
      // case ActivesOrOrderByCompany.orderByZA:
      //   setOrderByAz(false);
      //   break;
    }
  }

  //COMPUTEDS
  @computed
  get companyList => repository.companiesActives.value;

  @computed
  get companyListInactive => repository.companiesInactives.value;
}
