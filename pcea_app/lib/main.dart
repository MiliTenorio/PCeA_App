import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pcea_app/core/main_modular.dart';
import 'package:pcea_app/core/utils/AppColors.dart';
import 'package:pcea_app/features/schedule/presentation/stores/user_store.dart';
import 'package:pcea_app/features/schedule/presentation/widgets/available_options_widget.dart';
import 'package:pcea_app/features/schedule/presentation/widgets/custom_app_bar.dart';
import 'package:pcea_app/features/schedule/presentation/widgets/schedule_widget.dart';
import 'package:pcea_app/features/schedule/presentation/widgets/title_widget.dart';

void main() {
  runApp(ModularApp(module: MainModular(), child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Crescer e Aprender',
      theme: ThemeData(
  
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.orange),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final UserStore userStore = Modular.get<UserStore>();

  @override
Widget build(BuildContext context) {
  userStore.loadUser();

  return Scaffold(
    appBar: CustomAppBar(),
    body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/core/assets/pattern.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Observer(
        builder: (_) {
          return Column(
            children: [
              TitleWidget(title: 'Olá, ${userStore.user.name}!',),
              Expanded(
                child: ScheduleWidget(),
              ),
              AvailableOptionsWidget(),
            ],
          );
        }
      ),
    ),
  );
}

}
