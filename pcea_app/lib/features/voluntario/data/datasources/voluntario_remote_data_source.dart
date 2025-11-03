import '../models/voluntario_model.dart';

abstract class VoluntarioRemoteDataSource {
  Future<List<VoluntarioModel>> getAllVoluntarios();
  Future<VoluntarioModel> getVoluntarioById(int id);
  Future<VoluntarioModel> createVoluntario(VoluntarioModel voluntario);
  Future<VoluntarioModel> updateVoluntario(VoluntarioModel voluntario);
  Future<void> deleteVoluntario(int id);
}
