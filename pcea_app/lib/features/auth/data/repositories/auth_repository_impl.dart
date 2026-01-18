import '../../domain/entities/auth_token.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<AuthToken> login(String email, String password) async {
    final token = await remoteDataSource.login(
      email: email,
      password: password,
    );

    return AuthToken(token);
  }
}
