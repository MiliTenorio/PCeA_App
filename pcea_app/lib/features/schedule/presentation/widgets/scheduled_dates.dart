import 'package:flutter/material.dart';
import 'package:pcea_app/features/schedule/data/datasources/schedule_mockup.dart';

class ScheduledDates extends StatelessWidget {
  const ScheduledDates({super.key});

  @override
  Widget build(BuildContext context) {
    return (ScheduleMockup.myUser.scheduledDates.isEmpty) ?
           Column(
             children: [
               Text("Você ainda não foi escalado(a)!"),
               Image.asset("lib/core/assets/calendar.png", width:300, height:300),
             ],
           ) : Text ("Você está escalado para:");
  }
}