import '../entities/escala.dart';
import '../repositories/schedule_repository.dart';

class UpdateSchedules {
  final ScheduleRepository repository;

  UpdateSchedules(this.repository);

  Future<Escala> call(Escala escala) {
    return repository.updateSchedule(escala);
  }
}
