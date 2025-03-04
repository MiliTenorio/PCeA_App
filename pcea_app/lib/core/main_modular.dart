import 'package:flutter_modular/flutter_modular.dart';
import 'package:pcea_app/features/schedule/data/datasources/user_datasource.dart';
import 'package:pcea_app/features/schedule/data/repositories/user_repository_impl.dart';
import 'package:pcea_app/features/schedule/domain/repositories/user_repository.dart';
import 'package:pcea_app/features/schedule/domain/usecases/update_available_dates_usecase.dart';
import 'package:pcea_app/features/schedule/presentation/stores/user_store.dart';

class MainModular extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => UserDataSource(),),
    Bind.singleton((i) => UserRepositoryImpl(i.get<UserDataSource>()),),
    Bind.singleton((i) => UpdateAvailableDatesUseCase(i.get<UserRepository>()),),
    Bind.singleton((i) => UserStore(i.get(),),),
  ];

  /*@override
  List<ModularRoute> getRoutes() {
    return [
      ChildRoute('/', child:(_, args) => MyHomePage()),
      ChildRoute('/schedule', child:(_, args) => SchedulePage()),
    ];
  }*/
}
