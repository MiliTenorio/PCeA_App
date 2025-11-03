// data/models/schedule_model.dart
import '../../domain/entities/escala.dart';
import 'voluntario_escala_model.dart';

class EscalaModel extends Escala {
  EscalaModel({
    required super.id,
    required super.mes,
    required super.ano,
    required super.datas,
    required super.voluntarios,
  });

  factory EscalaModel.fromJson(Map<String, dynamic> json) {
    return EscalaModel(
      id: json['id'],
      mes: json['mes'],
      ano: json['ano'],
      datas:
          (json['datas'] as List<dynamic>)
              .map((d) => DateTime.parse(d as String))
              .toList(),
      voluntarios:
          (json['voluntarios'] as List<dynamic>)
              .map((v) => VoluntarioEscalaModel.fromJson(v))
              .toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'mes': mes,
    'ano': ano,
    'datas': datas.map((d) => d.toIso8601String().split('T').first).toList(),
    'voluntarios':
        voluntarios.map((v) => (v as VoluntarioEscalaModel).toJson()).toList(),
  };
}
