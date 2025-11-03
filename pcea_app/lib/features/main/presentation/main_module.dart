import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pcea_app/features/main/presentation/pages/main_page.dart';
import 'package:pcea_app/features/main/presentation/stores/main_store.dart';
import 'package:pcea_app/features/schedule_status/data/datasources/schedule_remote_datasource.dart';
import 'package:pcea_app/features/schedule_status/data/repositories/schedule_remote_data_source_impl.dart';
import 'package:pcea_app/features/schedule_status/data/repositories/schedule_repository_impl.dart';
import 'package:pcea_app/features/schedule_status/domain/entities/schedule_status_local_data_source.dart';
import 'package:pcea_app/features/schedule_status/domain/repositories/schedule_repository.dart';
import 'package:pcea_app/features/schedule_status/presentation/stores/schedule_status_store.dart';
import 'package:pcea_app/features/schedule_status/schedule_module.dart';
import 'package:pcea_app/features/voluntario/data/datasources/voluntario_remote_data_source.dart';
import 'package:pcea_app/features/voluntario/data/repositories/voluntario_remote_data_source_impl.dart';
import 'package:pcea_app/features/voluntario/data/repositories/voluntario_repository_impl.dart';
import 'package:pcea_app/features/voluntario/domain/repositories/voluntario_repository.dart';
import 'package:pcea_app/features/voluntario/presentation/stores/voluntario_store.dart';
import 'package:pcea_app/features/voluntario/voluntario_module.dart';

class MainModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => MainStore()),
    Bind.singleton((i) => Dio()),

    Bind.singleton<ScheduleRemoteDataSource>(
      (i) => ScheduleRemoteDataSourceImpl(dio: i()),
    ),

    Bind.singleton<ScheduleRepository>(
      (i) => ScheduleRepositoryImpl(remoteDataSource: i()),
    ),

    Bind.singleton<ScheduleStatusDataSource>(
      (i) => ScheduleStatusLocalDataSourceImpl(),
    ),

    Bind.singleton<ScheduleStatusStore>(
      (i) => ScheduleStatusStore(i<ScheduleStatusDataSource>()),
    ),

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
    ChildRoute('/', child: (_, __) => MainPage()),
    ModuleRoute('/schedule', module: ScheduleModule()),
    ModuleRoute('/volunteer', module: VoluntarioModule()),
  ];
}
