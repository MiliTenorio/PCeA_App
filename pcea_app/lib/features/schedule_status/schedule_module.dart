import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pcea_app/features/schedule_status/data/datasources/schedule_remote_datasource.dart';
import 'package:pcea_app/features/schedule_status/data/repositories/schedule_remote_data_source_impl.dart';
import 'package:pcea_app/features/schedule_status/data/repositories/schedule_repository_impl.dart';
import 'package:pcea_app/features/schedule_status/domain/entities/schedule_status_local_data_source.dart';
import 'package:pcea_app/features/schedule_status/domain/repositories/schedule_repository.dart';
import 'package:pcea_app/features/schedule_status/presentation/pages/schedule_status_page.dart';
import 'package:pcea_app/features/schedule_status/presentation/stores/schedule_status_store.dart';

class ScheduleModule extends Module {
  @override
  final List<Bind> binds = [
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
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => ScheduleStatusPage()),
  ];
}
