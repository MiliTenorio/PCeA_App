import '../entities/voluntario.dart';
import '../repositories/voluntario_repository.dart';

class UpdateVoluntario {
  final VoluntarioRepository repository;

  UpdateVoluntario(this.repository);

  Future<Voluntario> call(Voluntario voluntario) async {
    return repository.updateVoluntario(voluntario);
  }
}
