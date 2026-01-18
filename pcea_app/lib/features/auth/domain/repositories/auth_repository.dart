import 'package:pcea_app/features/auth/domain/entities/auth_token.dart';

abstract class AuthRepository {
  Future<AuthToken> login(String email, String password);
}
