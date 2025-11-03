import '../../domain/entities/escala.dart';

abstract class ScheduleRemoteDataSource {
  Future<List<Escala>> getAllSchedules();
  Future<Escala> getScheduleById(int id);
  Future<Escala> getScheduleByDate(String date);
  Future<Escala> getScheduleByMesAnoVoluntario({
    required int mes,
    required int ano,
    required int voluntarioId,
  });
  Future<Escala> createSchedule(Escala escala);
  Future<Escala> updateSchedule(Escala escala);
  Future<void> deleteSchedule(int id);
}
