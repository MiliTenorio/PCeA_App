import '../../domain/entities/usuario.dart';

class UsuarioModel extends Usuario {
  UsuarioModel({
    super.id,
    required super.email,
    required super.senha,
    required super.role,
    super.errorMessage,
  });

  factory UsuarioModel.fromJson(Map<String, dynamic> json) {
    return UsuarioModel(
      id: json['id']?.toInt(),
      email: json['email'],
      senha: '', // senha não retorna da API
      role: UserRole.values.firstWhere(
        (r) => r.toString().split('.').last == json['role'],
      ),
      errorMessage: json['errorMessage'],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'senha': senha,
    'role': role.toString().split('.').last,
  };
}
