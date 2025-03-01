import 'package:pcea_app/features/schedule/domain/entities/schedules.dart';

class User {
  final String email;
  final String name;
  final String password;
  final List<Schedule> scheduledDates;
  final List<Schedule> availabilitySchedule;

  User({required this.email, required this.name, required this.password, 
  required this.scheduledDates, required this.availabilitySchedule,});

    User copyWith({
    String? email,
    String? name,
    String? password,
    List<Schedule>? scheduledDates,
    List<Schedule>? availabilitySchedule,
  }) {
    return User(
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      scheduledDates: scheduledDates ?? this.scheduledDates,
      availabilitySchedule: availabilitySchedule ?? this.availabilitySchedule,
    );
  }
}