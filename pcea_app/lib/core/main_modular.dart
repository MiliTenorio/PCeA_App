import 'package:flutter_modular/flutter_modular.dart';
import 'package:pcea_app/features/auth/auth_module.dart';
import 'package:pcea_app/features/main/presentation/main_module.dart';
import 'package:pcea_app/features/schedule_status/schedule_module.dart';

class MainModular extends Module {
  @override
  final List<Bind> binds = [];
  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: AuthModule()),
    ModuleRoute('/home', module: MainModule()),
    ModuleRoute('/schedule', module: ScheduleModule())
    ];
}
