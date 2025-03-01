import 'package:pcea_app/features/schedule/domain/entities/schedules.dart';

abstract class UserRepository {
  Future<String> userName();
  Future<void> updateAvailableDates(List<Schedule> availableDates);
}