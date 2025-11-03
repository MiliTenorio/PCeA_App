// data/repositories/schedule_repository_impl.dart
import '../../domain/entities/escala.dart';
import '../../domain/repositories/schedule_repository.dart';
import '../datasources/schedule_remote_datasource.dart';
import '../models/schedule_model.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  final ScheduleRemoteDataSource remoteDataSource;

  ScheduleRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Escala> getSchedule({
    required int mes,
    required int ano,
    required int voluntarioId,
  }) async {
    final model = await remoteDataSource.getScheduleByMesAnoVoluntario(
      mes: mes,
      ano: ano,
      voluntarioId: voluntarioId,
    );
    return model; // EscalaModel é Escala, ou model.toEntity() se converter
  }

  @override
  Future<Escala> updateSchedule(Escala escala) async {
    final model = await remoteDataSource.updateSchedule(escala as EscalaModel);
    return model;
  }
}
