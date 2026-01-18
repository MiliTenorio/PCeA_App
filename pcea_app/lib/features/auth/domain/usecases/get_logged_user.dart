import 'package:pcea_app/features/auth/domain/entities/auth_token.dart';
import '../repositories/auth_repository.dart';

class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);

  Future<AuthToken> call(String email, String password) {
    return repository.login(email, password);
  }
}
