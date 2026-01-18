import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<String> login({
    required String email,
    required String password,
  });
}
