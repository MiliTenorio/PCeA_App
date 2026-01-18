import 'dart:convert';
import 'package:http/http.dart' as http;

import 'auth_remote_datasource.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<String> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('http://192.168.19.67:8080/auth/login');

    final response = await client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else if (response.statusCode == 401) {
      throw Exception('Credenciais inválidas');
    } else {
      throw Exception('Erro no servidor');
    }
  }
}
