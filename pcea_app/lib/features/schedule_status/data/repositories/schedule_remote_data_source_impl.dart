import 'package:dio/dio.dart';
import 'package:pcea_app/features/schedule_status/data/datasources/schedule_remote_datasource.dart';
import 'package:pcea_app/features/schedule_status/data/models/schedule_model.dart';

import '../../domain/entities/escala.dart';

class ScheduleRemoteDataSourceImpl implements ScheduleRemoteDataSource {
  final Dio dio;

  ScheduleRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<Escala>> getAllSchedules() async {
    final response = await dio.get('/crescer-aprender/escala');
    return (response.data as List).map((e) => EscalaModel.fromJson(e)).toList();
  }

  @override
  Future<Escala> getScheduleById(int id) async {
    final response = await dio.get('/crescer-aprender/escala/byId/$id');
    return EscalaModel.fromJson(response.data);
  }

  @override
  Future<Escala> getScheduleByDate(String date) async {
    final response = await dio.get('/crescer-aprender/escala/byDate/$date');
    return EscalaModel.fromJson(response.data);
  }

  @override
  Future<Escala> getScheduleByMesAnoVoluntario({
    required int mes,
    required int ano,
    required int voluntarioId,
  }) async {
    final response = await dio.get(
      '/crescer-aprender/escala/buscar-por-mes-ano-voluntario',
      queryParameters: {'mes': mes, 'ano': ano, 'idVoluntario': voluntarioId},
    );
    return EscalaModel.fromJson(response.data);
  }

  @override
  Future<Escala> createSchedule(Escala escala) async {
    final response = await dio.post(
      '/crescer-aprender/escala',
      data: (escala as EscalaModel).toJson(),
    );
    return EscalaModel.fromJson(response.data);
  }

  @override
  Future<Escala> updateSchedule(Escala escala) async {
    final response = await dio.put(
      '/crescer-aprender/escala/${escala.id}',
      data: (escala as EscalaModel).toJson(),
    );
    return EscalaModel.fromJson(response.data);
  }

  @override
  Future<void> deleteSchedule(int id) async {
    await dio.delete('/crescer-aprender/escala/$id');
  }
}
