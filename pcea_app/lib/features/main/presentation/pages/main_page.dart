import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pcea_app/core/utils/AppColors.dart';
import 'package:pcea_app/features/main/presentation/stores/main_store.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Modular.get<MainStore>();

    return Observer(
      builder:
          (_) => Scaffold(
            body: const RouterOutlet(), // exibe a rota atual do MainModule
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: store.currentIndex,
              selectedItemColor: AppColors.orange,
              unselectedItemColor: Colors.grey,
              onTap: (index) {
                store.setIndex(index);

                switch (index) {
                  case 0:
                    Modular.to.navigate(
                      '/home/schedule/',
                    ); // rota do ScheduleModule
                    break;
                  case 1:
                    Modular.to.navigate(
                      '/home/availability/',
                    ); // AvailabilityPage
                    break;
                  case 2:
                    Modular.to.navigate('/home/settings/'); // SettingsPage
                    break;
                }
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
