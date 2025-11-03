import 'package:pcea_app/features/auth/data/repositories/auth_repository_mock.dart';

import '../entities/usuario.dart';
//import '../repositories/auth_repository.dart';

class LoginUser {
  //final AuthRepository repository;
  final AuthRepositoryMock repository;

  LoginUser(this.repository);

  Future<Usuario> call(String email, String senha) async {
    return repository.login(email, senha);
  }
}
