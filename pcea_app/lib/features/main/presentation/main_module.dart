import 'package:flutter_modular/flutter_modular.dart';
import 'package:pcea_app/features/main/presentation/pages/availability_page.dart';
import 'package:pcea_app/features/main/presentation/pages/main_page.dart';
import 'package:pcea_app/features/main/presentation/stores/main_store.dart';
import 'package:pcea_app/features/schedule_status/schedule_module.dart';
import 'package:pcea_app/features/voluntario/presentation/pages/settings_page.dart';
import 'package:pcea_app/features/voluntario/voluntario_module.dart';

class MainModule extends Module {
  @override
  final List<Bind> binds = [Bind.singleton((i) => MainStore())];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => const MainPage(),
      children: [
        ModuleRoute('/schedule', module: ScheduleModule()),
        ChildRoute('/availability', child: (_, __) => const AvailabilityPage()),
        ChildRoute('/settings', child: (_, __) => const SettingsPage()),
        //RedirectRoute('', to: '/schedule/'),
      ],
    ),
    ModuleRoute('/volunteer', module: VoluntarioModule()),
  ];
}
