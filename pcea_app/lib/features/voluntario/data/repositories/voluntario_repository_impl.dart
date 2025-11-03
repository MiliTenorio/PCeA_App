import '../../domain/entities/voluntario.dart';
import '../../domain/repositories/voluntario_repository.dart';
import '../datasources/voluntario_remote_data_source.dart';
import '../models/voluntario_model.dart';

class VoluntarioRepositoryImpl implements VoluntarioRepository {
  final VoluntarioRemoteDataSource remoteDataSource;

  VoluntarioRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Voluntario>> getAllVoluntarios() async {
    return await remoteDataSource.getAllVoluntarios();
  }

  @override
  Future<Voluntario> getVoluntarioById(int id) async {
    return await remoteDataSource.getVoluntarioById(id);
  }

  @override
  Future<Voluntario> createVoluntario(Voluntario voluntario) async {
    final model = VoluntarioModel(
      id: voluntario.id,
      nome: voluntario.nome,
      email: voluntario.email,
      senha: voluntario.senha,
      datasDisponiveis: voluntario.datasDisponiveis,
    );
    return await remoteDataSource.createVoluntario(model);
  }

  @override
  Future<Voluntario> updateVoluntario(Voluntario voluntario) async {
    final model = VoluntarioModel(
      id: voluntario.id,
      nome: voluntario.nome,
      email: voluntario.email,
      senha: voluntario.senha,
      datasDisponiveis: voluntario.datasDisponiveis,
    );
    return await remoteDataSource.updateVoluntario(model);
  }

  @override
  Future<void> deleteVoluntario(int id) async {
    return await remoteDataSource.deleteVoluntario(id);
  }
}
