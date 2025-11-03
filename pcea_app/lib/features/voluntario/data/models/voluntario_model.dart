import '../../domain/entities/voluntario.dart';

class VoluntarioModel extends Voluntario {
  VoluntarioModel({
    required super.id,
    required super.nome,
    required super.email,
    required super.senha,
    required super.datasDisponiveis,
  });

  factory VoluntarioModel.fromJson(Map<String, dynamic> json) {
    return VoluntarioModel(
      id: json['id'] as int,
      nome: json['nome'] as String,
      email: json['email'] as String,
      senha: json['senha'] as String,
      datasDisponiveis:
          (json['datasDisponiveis'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nome": nome,
      "email": email,
      "senha": senha,
      "datasDisponiveis": datasDisponiveis,
    };
  }
}
