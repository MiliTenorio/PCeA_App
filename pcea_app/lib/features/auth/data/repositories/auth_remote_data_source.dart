import 'package:dio/dio.dart';
import 'package:pcea_app/features/auth/data/datasources/auth_remote_datasource.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({Dio? dio})
    : dio = dio ?? Dio(); // pode injetar Dio ou usar padrão

  @override
  Future<Map<String, dynamic>> login(String email, String senha) async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: {'username': email, 'password': senha},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200) {
        // A API retorna token como texto puro
        return {
          'email': email,
          'role': 'VOLUNTARIO', // ou COORDENADOR se você tiver lógica
          'token': response.data, // opcionalmente armazena o token
        };
      } else {
        throw Exception('Falha no login: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        // resposta da API com erro (ex: 401)
        throw Exception(e.response?.data ?? 'Erro no login');
      } else {
        throw Exception('Erro de conexão: ${e.message}');
      }
    }
  }
}
