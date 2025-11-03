import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pcea_app/core/utils/AppColors.dart';
import 'package:pcea_app/features/main/presentation/pages/availability_page.dart';
import 'package:pcea_app/features/main/presentation/stores/main_store.dart';
import 'package:pcea_app/features/schedule_status/presentation/pages/schedule_status_page.dart';
import 'package:pcea_app/features/voluntario/presentation/pages/settings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  final MainStore store = Modular.get<MainStore>();
  late final TabController _tabController;

  final List<Widget> _pages = const [
    ScheduleStatusPage(),
    AvailabilityPage(),
    SettingsPage(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _pages.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        store.setIndex(_tabController.index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder:
          (_) => Scaffold(
            body: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: _pages,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: store.currentIndex,
              selectedItemColor: AppColors.orange,
              unselectedItemColor: Colors.grey,
              onTap: (index) {
                store.setIndex(index);
                _tabController.animateTo(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today_outlined),
                  label: 'Escala',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.event_available_outlined),
                  label: 'Disponibilidade',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  label: 'Configurações',
                ),
              ],
            ),
          ),
    );
  }
}
