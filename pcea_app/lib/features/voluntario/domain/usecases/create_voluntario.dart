import '../entities/voluntario.dart';
import '../repositories/voluntario_repository.dart';

class CreateVoluntario {
  final VoluntarioRepository repository;

  CreateVoluntario(this.repository);

  Future<Voluntario> call(Voluntario voluntario) async {
    return await repository.createVoluntario(voluntario);
  }
}
