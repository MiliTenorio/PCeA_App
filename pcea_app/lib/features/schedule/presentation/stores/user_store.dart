import 'package:mobx/mobx.dart';
import 'package:pcea_app/core/utils/strings/Enums.dart';
import 'package:pcea_app/features/schedule/domain/entities/user.dart';
import 'package:pcea_app/features/schedule/domain/repositories/user_repository.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  final UserRepository repository;
  _UserStore(this.repository); 

  @observable
  User user = User(email: "", name: "", password: "", scheduledDates: [], availableDates: []);

  @observable
  ObservableList<DateTime> userAvailableDates = ObservableList<DateTime>();

  @observable
  ObservableList<DateTime> userScheduledDates = ObservableList<DateTime>();

  @observable
  List<DateTime> allDates = [];

  @action
  void loadAllDates() {
    final today = DateTime.now();
    allDates = user.scheduledDates
        .where((date) => date.toLocal().difference(today).inDays >= 0)
        .toList()
      ..sort();

    //scheduleNotifications(allDates);
  }

  @action
  Future<void> loadUser() async {
    user = await repository.getUser();
    userScheduledDates.clear();
    userAvailableDates.clear();
    userAvailableDates.addAll(user.availableDates);
    userScheduledDates.addAll(user.scheduledDates);
  }

  @action
  void getAvailableDates() {   
    userAvailableDates.clear();
    userAvailableDates.addAll(user.availableDates);
  }
  
  @action
  void getScheduledDates() {   
    userScheduledDates.clear();
    userScheduledDates.addAll(user.scheduledDates);
  }

  @action
  void updateAvailableDatesSchedule() {
    print("\n>> ### New Available Dates:\n");
    for(DateTime i in userAvailableDates){
      print(">> $i");
    }
  }

  @action
  void toggleDateSelection(DateTime date) {
    if (userAvailableDates.contains(date)) {
      userAvailableDates.removeWhere((d) => d == date);
      print('>> Remove $date');
    } else {
      userAvailableDates.add(date);
      print('>> Add $date');
    }
  }

    @action
  void clearSelection() {
    print('>> Clear selection');
    userAvailableDates.clear();
  }

  @computed
  ScheduleStatus get scheduleStatus {
    if (user.availableDates.isEmpty) {
      return ScheduleStatus.noAvailability;
    } else if (user.scheduledDates.isEmpty) {
      return ScheduleStatus.waitingForSchedule;
    } else {
      return ScheduleStatus.scheduled;
    }
  }
}
