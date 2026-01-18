import 'package:flutter_modular/flutter_modular.dart';

import 'features/auth/auth_module.dart';
import 'features/main/presentation/main_module.dart';

class AppModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      '/',
      module: AuthModule(),
    ),
    ModuleRoute(
      '/home',
      module: MainModule(),
    ),
  ];
}
