import 'package:pcea_app/features/schedule/domain/entities/schedules.dart';

class User {
  final String email;
  final String name;
  final String password;
  final List<Schedule> scheduledDates;

  User({required this.email, required this.name, required this.password, required this.scheduledDates,});
}