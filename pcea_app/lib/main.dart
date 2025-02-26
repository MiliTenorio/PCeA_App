import 'package:flutter/material.dart';
import 'package:pcea_app/core/utils/AppColors.dart';
import 'package:pcea_app/features/schedule/data/datasources/schedule_mockup.dart';
import 'package:pcea_app/features/schedule/presentation/pages/schedule_page.dart';
import 'package:pcea_app/features/schedule/presentation/widgets/scheduled_dates.dart';

void main() {
  runApp(const MyApp());
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
      home: MyHomePage(title: 'Olá, ${ScheduleMockup.myUser.name}!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Image.asset("lib/core/assets/pattern.png", fit: BoxFit.cover),
        title: Text(widget.title, style: TextStyle(fontWeight: FontWeight.w700,),),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ScheduledDates(),
          TextButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SchedulePage()),
              );
            }, child: Text("Minha disponibilidade"),),
          ],
        ),
      ),
    );
  }
}
