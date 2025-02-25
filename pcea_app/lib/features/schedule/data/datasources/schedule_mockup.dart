import 'package:pcea_app/core/utils/strings/Strings.dart';
import 'package:pcea_app/features/schedule/domain/entities/schedules.dart';
import 'package:pcea_app/features/schedule/domain/entities/user.dart';

class ScheduleMockup {
List<Schedule> schedules = [
    Schedule(month: Strings.january, selectedDates: [
      DateTime(2025, 1, 4),
      DateTime(2025, 1, 11),
      DateTime(2025, 1, 18),
      DateTime(2025, 1, 25),
    ]),
    Schedule(month: Strings.february, selectedDates: [
      DateTime(2025, 2, 1),
      DateTime(2025, 2, 8),
      DateTime(2025, 2, 15),
      DateTime(2025, 2, 22),
    ]),
    Schedule(month: Strings.march, selectedDates: [
      DateTime(2025, 3, 1),
      DateTime(2025, 3, 8),
      DateTime(2025, 3, 15),
      DateTime(2025, 3, 22),
      DateTime(2025, 3, 29),
    ]),
    Schedule(month: Strings.april, selectedDates: [
      DateTime(2025, 4, 5),
      DateTime(2025, 4, 12),
      DateTime(2025, 4, 19),
      DateTime(2025, 4, 26),
    ]),
    Schedule(month: Strings.may, selectedDates: [
      DateTime(2025, 5, 3),
      DateTime(2025, 5, 10),
      DateTime(2025, 5, 17),
      DateTime(2025, 5, 24),
      DateTime(2025, 5, 31),
    ]),
    Schedule(month: Strings.june, selectedDates: [
      DateTime(2025, 6, 7),
      DateTime(2025, 6, 14),
      DateTime(2025, 6, 21),
      DateTime(2025, 6, 28),
    ]),
    Schedule(month: Strings.july, selectedDates: [
      DateTime(2025, 7, 5),
      DateTime(2025, 7, 12),
      DateTime(2025, 7, 19),
      DateTime(2025, 7, 26),
    ]),
    Schedule(month: Strings.august, selectedDates: [
      DateTime(2025, 8, 2),
      DateTime(2025, 8, 9),
      DateTime(2025, 8, 16),
      DateTime(2025, 8, 23),
      DateTime(2025, 8, 30),
    ]),
    Schedule(month: Strings.september, selectedDates: [
      DateTime(2025, 9, 6),
      DateTime(2025, 9, 13),
      DateTime(2025, 9, 20),
      DateTime(2025, 9, 27),
    ]),
    Schedule(month: Strings.october, selectedDates: [
      DateTime(2025, 10, 4),
      DateTime(2025, 10, 11),
      DateTime(2025, 10, 18),
      DateTime(2025, 10, 25),
    ]),
    Schedule(month: Strings.november, selectedDates: [
      DateTime(2025, 11, 1),
      DateTime(2025, 11, 8),
      DateTime(2025, 11, 15),
      DateTime(2025, 11, 22),
      DateTime(2025, 11, 29),
    ]),
    Schedule(month: Strings.december, selectedDates: [
      DateTime(2025, 12, 6),
      DateTime(2025, 12, 13),
      DateTime(2025, 12, 20),
      DateTime(2025, 12, 27),
    ]),
  ]; 

  static User myUser = User(email: "mili@eu.com", name: "Milena", password: "123", scheduledDates: []);

  static List<Schedule> scheduledDates = [
    Schedule(month: Strings.march, selectedDates: [
      DateTime(2025, 3, 1),
      DateTime(2025, 3, 15),
      DateTime(2025, 3, 29),
    ]),
  ]; 

}
