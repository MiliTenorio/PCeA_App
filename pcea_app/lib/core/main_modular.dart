import 'package:flutter_modular/flutter_modular.dart';
import 'package:pcea_app/features/schedule/data/datasources/user_datasource.dart';
import 'package:pcea_app/features/schedule/data/repositories/user_repository_impl.dart';
import 'package:pcea_app/features/schedule/domain/repositories/user_repository.dart';
import 'package:pcea_app/features/schedule/domain/usecases/update_available_dates_usecase.dart';
import 'package:pcea_app/features/schedule/presentation/pages/schedule_page.dart';
import 'package:pcea_app/features/schedule/presentation/stores/user_store.dart';
import 'package:pcea_app/main.dart';

class MainModular extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => UserStore(),),
    Bind<UserRepository>((i) => UserRepositoryImpl(i.get<UserDataSource>())),
    Bind<UserDataSource>((i) => UserDataSource()),
    Bind<UpdateAvailableDatesUseCase>((i) => UpdateAvailableDatesUseCase(i.get<UserRepository>())),
  ];

  @override
  List<ModularRoute> getRoutes() {
    return [
      ChildRoute('/', child:(_, args) => MyHomePage()),
      ChildRoute('/schedule', child:(_, args) => SchedulePage()),
    ];
  }
}
