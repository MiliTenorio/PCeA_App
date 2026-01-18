import 'package:flutter_modular/flutter_modular.dart';
import 'package:pcea_app/features/main/presentation/pages/main_page.dart';
import 'package:pcea_app/features/schedule_status/presentation/pages/schedule_status_page.dart';
import 'package:pcea_app/features/main/presentation/pages/availability_page.dart';
import 'package:pcea_app/features/main/presentation/pages/settings_page.dart';

class MainModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => const MainPage(),
      children: [
        ChildRoute(
          '/schedule',
          child: (_, __) => const ScheduleStatusPage(),
        ),
        ChildRoute(
          '/availability',
          child: (_, __) => const AvailabilityPage(),
        ),
        ChildRoute(
          '/settings',
          child: (_, __) => const SettingsPage(),
        ),
      ],
    ),
  ];
}
