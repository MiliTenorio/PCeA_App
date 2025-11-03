import 'package:pcea_app/features/auth/domain/entities/usuario.dart';
import 'package:pcea_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryMock implements AuthRepository {
  @override
  Future<Usuario> login(String email, String senha) async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (email.contains('@') && senha.length >= 3) {
      return Usuario(
        id: 1,
        email: email,
        senha: senha,
        role: UserRole.VOLUNTARIO,
      );
    } else {
      throw Exception('Email ou senha inválidos');
    }
  }
}
