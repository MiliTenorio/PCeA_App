import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pcea_app/features/schedule_status/domain/entities/schedule_status_local_data_source.dart';
import 'package:pcea_app/features/voluntario/data/datasources/voluntario_remote_data_source.dart';
import 'package:pcea_app/features/voluntario/data/repositories/voluntario_remote_data_source_impl.dart';
import 'package:pcea_app/features/voluntario/data/repositories/voluntario_repository_impl.dart';
import 'package:pcea_app/features/voluntario/domain/repositories/voluntario_repository.dart';
import 'package:pcea_app/features/voluntario/presentation/pages/settings_page.dart';
import 'package:pcea_app/features/voluntario/presentation/stores/voluntario_store.dart';

class VoluntarioModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => Dio()),

    Bind.singleton<VoluntarioRemoteDataSource>(
      (i) => VoluntarioRemoteDataSourceImpl(dio: i()),
    ),

    Bind.singleton<VoluntarioRepository>(
      (i) => VoluntarioRepositoryImpl(remoteDataSource: i()),
    ),

    Bind.singleton<ScheduleStatusDataSource>(
      (i) => ScheduleStatusLocalDataSourceImpl(),
    ),

    Bind.singleton<VoluntarioStore>(
      (i) => VoluntarioStore(i<VoluntarioRepository>()),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => SettingsPage()),
  ];
}
