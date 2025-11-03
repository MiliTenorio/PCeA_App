enum UserRole { COORDENADOR, VOLUNTARIO }

class Usuario {
  final int? id;
  final String email;
  final String senha;
  final UserRole role;
  String? errorMessage;

  Usuario({
    this.id,
    required this.email,
    required this.senha,
    required this.role,
    this.errorMessage,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id']?.toInt(),
      email: json['email'],
      senha: '', // Senha não deve vir da API por segurança
      role: UserRole.values.firstWhere(
        (r) => r.toString().split('.').last == json['role'],
      ),
      errorMessage: json['errorMessage'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'senha': senha,
    'role': role.toString().split('.').last,
  };
}
