import 'user.dart';
import 'package:pcea_app/core/utils/enums.dart';

class Voluntario extends User {
  final String name;
  final List<DateTime> availableDates;

  const Voluntario({
    required this.name,
    required this.availableDates,
    required super.email,
  }) : super(role: UserRole.VOLUNTEER);

  bool availableDate(DateTime data) {
    return availableDates.any(
      (d) =>
          d.year == data.year &&
          d.month == data.month &&
          d.day == data.day,
    );
  }
}
