
class User {
  final String email;
  final String name;
  final String password;
  final List<DateTime> scheduledDates;
  final List<DateTime> availableDates;

  User({required this.email, required this.name, required this.password, 
  required this.scheduledDates, required this.availableDates,});

  User copyWith({
    String? email,
    String? name,
    String? password,
    List<DateTime>? scheduledDates,
    List<DateTime>? availableDates,
  }) {
    return User(
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      scheduledDates: scheduledDates ?? this.scheduledDates,
      availableDates: availableDates ?? this.availableDates,
    );
  }
}