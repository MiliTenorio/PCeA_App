import '../entities/voluntario.dart';

abstract class VoluntarioRepository {
  Future<List<Voluntario>> getAllVoluntarios();
  Future<Voluntario> getVoluntarioById(int id);
  Future<Voluntario> createVoluntario(Voluntario voluntario);
  Future<Voluntario> updateVoluntario(Voluntario voluntario);
  Future<void> deleteVoluntario(int id);
}
