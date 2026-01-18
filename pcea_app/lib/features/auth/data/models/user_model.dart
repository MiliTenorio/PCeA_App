import '../../domain/entities/user.dart';
import 'package:pcea_app/core/utils/enums.dart';

class UserModel extends User {
  const UserModel({
    required super.email,
    required super.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      role: UserRole.values.firstWhere(
        (r) => r.name == json['role'],
      ),
    );
  }

  User toEntity() => User(
    email: email,
    role: role,
  );
}

