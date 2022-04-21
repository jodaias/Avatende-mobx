import 'package:mobx/mobx.dart';
part 'page_store.g.dart';

class PageStore = _PageStoreBase with _$PageStore;

abstract class _PageStoreBase with Store {
  @observable
  int page = 0;

  @action
  void setPage(int value) => page = value;
}
