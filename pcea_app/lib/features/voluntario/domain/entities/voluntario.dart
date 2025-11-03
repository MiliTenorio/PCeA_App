class Voluntario {
  final int? id;
  final String nome;
  final String email;
  final String senha;
  final List<String> datasDisponiveis;

  Voluntario({
    this.id,
    required this.nome,
    required this.email,
    required this.senha,
    required this.datasDisponiveis,
  });

  factory Voluntario.fromJson(Map<String, dynamic> json) => Voluntario(
    id: json['id'],
    nome: json['nome'],
    email: json['email'],
    senha: json['senha'],
    datasDisponiveis: List<String>.from(json['datasDisponiveis'] ?? []),
  );

  Map<String, dynamic> toJson() => {
    if (id != null) 'id': id,
    'nome': nome,
    'email': email,
    'senha': senha,
    'datasDisponiveis': datasDisponiveis,
  };

  // copyWith
  Voluntario copyWith({
    int? id,
    String? nome,
    String? email,
    String? senha,
    List<String>? datasDisponiveis,
  }) {
    return Voluntario(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      senha: senha ?? this.senha,
      datasDisponiveis: datasDisponiveis ?? this.datasDisponiveis,
    );
  }
}
