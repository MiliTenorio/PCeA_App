import 'package:pcea_app/features/auth/data/models/user_model.dart';

import '../../domain/entities/usuario.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Usuario> login(String email, String senha) async {
    final json = await remoteDataSource.login(email, senha);
    return UsuarioModel.fromJson(json); // devolve como entidade do domain
  }
}
