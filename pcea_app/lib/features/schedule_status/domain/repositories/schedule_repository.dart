import '../entities/escala.dart';

abstract class ScheduleRepository {
  Future<Escala> getSchedule({
    required int mes,
    required int ano,
    required int voluntarioId,
  });

  Future<Escala> updateSchedule(Escala escala);
}
