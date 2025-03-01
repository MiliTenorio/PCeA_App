import 'package:flutter_modular/flutter_modular.dart';
import 'package:pcea_app/features/schedule/presentation/pages/schedule_page.dart';
import 'package:pcea_app/features/schedule/presentation/stores/user_store.dart';
import 'package:pcea_app/main.dart';

class MainModular extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => UserStore(),),
  ];

  @override
  List<ModularRoute> getRoutes() {
    return [
      ChildRoute('/', child:(_, args) => MyHomePage()),
      ChildRoute('/schedule', child:(_, args) => SchedulePage()),
    ];
  }
}
