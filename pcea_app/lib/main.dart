import 'package:flutter/material.dart';
import 'package:pcea_app/core/utils/AppColors.dart';
import 'package:pcea_app/features/schedule/data/datasources/schedule_mockup.dart';
import 'package:pcea_app/features/schedule/presentation/pages/schedule_page.dart';
import 'package:pcea_app/features/schedule/presentation/widgets/schedule.dart';
import 'package:pcea_app/features/schedule/presentation/widgets/title_widget.dart';

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
      backgroundColor: AppColors.white,
      //turn this better updating the image
      flexibleSpace: SafeArea(child: Align(alignment: Alignment.centerLeft, 
      child: Transform.scale(scale: 2.5, child: Image.asset('lib/core/assets/logo_pcea.png', width: 280,),)),),
    ),
    body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/core/assets/pattern.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          TitleWidget(title: 'Olá, ${ScheduleMockup.myUser.name}!',),
          Expanded(
            child: Schedule(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Container(
              decoration: BoxDecoration(color: AppColors.yellow, borderRadius: BorderRadius.all(Radius.circular(20,),),),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SchedulePage()),
                    );
                  },
                  child: Text("Disponibilidade", 
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

}
