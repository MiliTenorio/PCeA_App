import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pcea_app/core/utils/AppColors.dart';
import 'package:pcea_app/features/schedule/presentation/stores/user_store.dart';
import 'package:pcea_app/features/schedule/presentation/widgets/months_options_widget.dart';
import 'package:pcea_app/features/schedule/presentation/widgets/title_widget.dart';
import 'package:pcea_app/features/schedule/presentation/widgets/send_dates_dialog.dart';


class SchedulePage extends StatefulWidget {
   SchedulePage({super.key});
    final UserStore userStore = Modular.get<UserStore>();

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {

  @override
  Widget build(BuildContext context) {
    widget.userStore.getAvailableDates();

    return Scaffold(
    appBar: AppBar(
      backgroundColor: AppColors.white,
      //turn this better updating the image
      flexibleSpace: SafeArea(child: Align(alignment: Alignment.centerLeft, 
      child: Transform.scale(scale: 2.5, child: Image.asset('lib/core/assets/logo_pcea.png', width: 340,),)),),
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
            TitleWidget(title: 'Selecione sua disponibilidade'),
            MonthsOptionsWidget(),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Container(
              decoration: BoxDecoration(color: AppColors.yellow, borderRadius: BorderRadius.all(Radius.circular(20,),),),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: TextButton(
                  onPressed: () => showSendDatesDialog(context),
                  child: Text("Enviar", 
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