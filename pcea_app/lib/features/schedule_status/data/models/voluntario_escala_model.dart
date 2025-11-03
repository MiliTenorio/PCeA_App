// data/models/voluntario_escala_model.dart
import '../../domain/entities/escala.dart';

class VoluntarioEscalaModel extends VoluntarioEscala {
  VoluntarioEscalaModel({
    required super.id,
    required super.nome,
    required super.email,
    required super.senha,
    required super.datasDisponiveis,
  });

  factory VoluntarioEscalaModel.fromJson(Map<String, dynamic> json) {
    return VoluntarioEscalaModel(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      senha: json['senha'],
      datasDisponiveis:
          (json['datasDisponiveis'] as List<dynamic>)
              .map((d) => DateTime.parse(d as String))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'nome': nome,
    'email': email,
    'senha': senha,
    'datasDisponiveis':
        datasDisponiveis
            .map((d) => d.toIso8601String().split('T').first)
            .toList(),
  };
}
