import 'package:dio/dio.dart';
import 'package:pcea_app/features/voluntario/data/datasources/voluntario_remote_data_source.dart';
import 'package:pcea_app/features/voluntario/data/models/voluntario_model.dart';

class VoluntarioRemoteDataSourceImpl implements VoluntarioRemoteDataSource {
  final Dio dio;

  VoluntarioRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<VoluntarioModel>> getAllVoluntarios() async {
    final response = await dio.get('/crescer-aprender/voluntarios');
    final list =
        (response.data as List)
            .map((json) => VoluntarioModel.fromJson(json))
            .toList();
    return list;
  }

  @override
  Future<VoluntarioModel> getVoluntarioById(int id) async {
    final response = await dio.get('/crescer-aprender/voluntarios/$id');
    return VoluntarioModel.fromJson(response.data);
  }

  @override
  Future<VoluntarioModel> createVoluntario(VoluntarioModel voluntario) async {
    final response = await dio.post(
      '/crescer-aprender/voluntarios',
      data: voluntario.toJson(),
    );
    return VoluntarioModel.fromJson(response.data);
  }

  @override
  Future<VoluntarioModel> updateVoluntario(VoluntarioModel voluntario) async {
    final response = await dio.put(
      '/crescer-aprender/voluntarios/${voluntario.id}',
      data: voluntario.toJson(),
    );
    return VoluntarioModel.fromJson(response.data);
  }

  @override
  Future<void> deleteVoluntario(int id) async {
    await dio.delete('/crescer-aprender/voluntarios/$id');
  }
}
