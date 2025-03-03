import 'package:mobx/mobx.dart';
import 'package:pcea_app/features/schedule/data/datasources/schedule_mockup.dart';
import 'package:pcea_app/features/schedule/domain/entities/user.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  User user = ScheduleMockup.myUser;

  @observable
  String userName = "";

  @observable
  ObservableList<DateTime> userAvailableDates = ObservableList<DateTime>();

  //In the first verion, I dont will implement this yet
  //@action
  //void updateName(String newName) {
  //  user = user.copyWith(name: newName);
  //}

  //@action
  //void updateEmail(String newEmail) {
  //  user = user.copyWith(email: newEmail);
  //}

  //@action
  //void updateScheduledDates(List<Schedule> newScheduled) {
  //  user = user.copyWith(scheduledDates: newScheduled);
  //}

  @action
  void updateUserName() {userName = user.name;}

  @action
  void getAvailableDates() {   
    userAvailableDates.clear();
    userAvailableDates.addAll(user.availableDates);
  }

  @action
  void updateAvailableDatesSchedule() {
    //user = user.copyWith(availableDates: newAvailableDates);
    print("\n### New Available Dates:\n");
    for(DateTime i in userAvailableDates){
      print(i.toString());
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
}
