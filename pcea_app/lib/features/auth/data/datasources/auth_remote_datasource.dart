abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> login(String email, String senha);
}
