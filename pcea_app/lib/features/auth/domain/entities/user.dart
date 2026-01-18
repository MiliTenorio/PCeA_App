import 'package:pcea_app/core/utils/enums.dart';

class User {
  final String email;
  final UserRole role;

  const User({
    required this.email,
    required this.role,
  });
}