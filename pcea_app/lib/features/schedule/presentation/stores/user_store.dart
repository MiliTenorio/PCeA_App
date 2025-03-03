import 'package:mobx/mobx.dart';
import 'package:pcea_app/features/schedule/data/datasources/schedule_mockup.dart';
import 'package:pcea_app/features/schedule/domain/entities/schedules.dart';
import 'package:pcea_app/features/schedule/domain/entities/user.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  User user = ScheduleMockup.myUser;

  @observable
  String userName = "";

  @observable
  late List<DateTime> userAvailableDates;

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
  void getAvailableDates() { userAvailableDates = user.availableDates; }

  @action
  void updateAvailableDatesSchedule(List<DateTime> newAvailableDates) {
    //user = user.copyWith(availableDates: newAvailableDates);
    print("\n### New Available Dates:\n");
    for(DateTime i in newAvailableDates){
      print(i.toString());
    }
  }
}
