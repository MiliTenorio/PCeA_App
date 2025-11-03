import 'package:mobx/mobx.dart';

part 'main_store.g.dart';

class MainStore = _MainStoreBase with _$MainStore;

abstract class _MainStoreBase with Store {
  @observable
  int currentIndex = 0;

  @action
  void setIndex(int index) {
    currentIndex = index;
  }
}
