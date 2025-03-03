import 'package:pcea_app/features/schedule/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> getUser();
  Future<void> updateUser(User user);
  Future<void> updateAvailableDates(List<DateTime> newAvailableDates);
  Future<void> updateScheduledDates(List<DateTime> newScheduledDates);
}
