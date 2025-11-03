class Escala {
  final int id;
  final int mes;
  final int ano;
  final List<DateTime> datas;
  final List<VoluntarioEscala> voluntarios;

  const Escala({
    required this.id,
    required this.mes,
    required this.ano,
    required this.datas,
    required this.voluntarios,
  });

  factory Escala.fromJson(Map<String, dynamic> json) {
    return Escala(
      id: json['id'],
      mes: json['mes'],
      ano: json['ano'],
      datas:
          (json['datas'] as List<dynamic>)
              .map((e) => DateTime.parse(e as String))
              .toList(),
      voluntarios:
          (json['voluntarios'] as List<dynamic>)
              .map((v) => VoluntarioEscala.fromJson(v))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'mes': mes,
      'ano': ano,
      'datas': datas.map((d) => d.toIso8601String().split('T').first).toList(),
      'voluntarios': voluntarios.map((v) => v.toJson()).toList(),
    };
  }
}

class VoluntarioEscala {
  final int id;
  final String nome;
  final String email;
  final String senha;
  final List<DateTime> datasDisponiveis;

  const VoluntarioEscala({
    required this.id,
    required this.nome,
    required this.email,
    required this.senha,
    required this.datasDisponiveis,
  });

  factory VoluntarioEscala.fromJson(Map<String, dynamic> json) {
    return VoluntarioEscala(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      senha: json['senha'],
      datasDisponiveis:
          (json['datasDisponiveis'] as List<dynamic>)
              .map((e) => DateTime.parse(e as String))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
}
