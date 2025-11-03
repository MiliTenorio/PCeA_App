import '../repositories/voluntario_repository.dart';

class DeleteVoluntario {
  final VoluntarioRepository repository;

  DeleteVoluntario(this.repository);

  Future<void> call(int id) async {
    await repository.deleteVoluntario(id);
  }
}
