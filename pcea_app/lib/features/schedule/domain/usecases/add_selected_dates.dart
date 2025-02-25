import 'package:pcea_app/features/schedule/domain/entities/schedules.dart';

class AddSelectedDates {
  Schedule call(Schedule schedule, List<DateTime> newDates) {
    return Schedule(month: schedule.month, selectedDates: newDates);
  }
}