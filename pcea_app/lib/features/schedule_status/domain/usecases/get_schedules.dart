import '../entities/escala.dart';
import '../repositories/schedule_repository.dart';

class GetSchedules {
  final ScheduleRepository repository;

  GetSchedules(this.repository);

  Future<Escala> call({
    required int mes,
    required int ano,
    required int voluntarioId,
  }) {
    return repository.getSchedule(
      mes: mes,
      ano: ano,
      voluntarioId: voluntarioId,
    );
  }
}
