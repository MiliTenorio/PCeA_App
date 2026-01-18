import 'user.dart';
import 'package:pcea_app/core/utils/enums.dart';

class Coordinator extends User {
  const Coordinator({
    required super.email,
  }) : super(role: UserRole.COORDINATOR);

  bool scheduleManagement() => true;
}
