import '../entities/voluntario.dart';
import '../repositories/voluntario_repository.dart';

class GetVoluntarios {
  final VoluntarioRepository repository;

  GetVoluntarios(this.repository);

  Future<List<Voluntario>> call() async {
    return repository.getAllVoluntarios();
  }
}
