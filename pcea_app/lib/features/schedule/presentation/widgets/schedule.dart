import 'package:flutter/material.dart';
import 'package:pcea_app/core/utils/strings/Enums.dart';
import 'package:pcea_app/features/schedule/data/datasources/schedule_mockup.dart';
import 'package:pcea_app/features/schedule/presentation/widgets/dates_widget.dart';
import 'package:pcea_app/features/schedule/presentation/widgets/schedule_status_widget.dart';

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    ScheduleStatus status = getUserScheduleStatus();
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        switch (status) {
          ScheduleStatus.noAvailability => ScheduleStatusWidget(
            text: "Você ainda não informou quais datas está disponível!", 
            pathImage: "lib/core/assets/waiting_availabity.png"),
          ScheduleStatus.waitingForSchedule => ScheduleStatusWidget(
            text: "Você ainda não foi escalado(a)\nAguarde!", 
            pathImage: "lib/core/assets/wait_for_scheluded.png",),
          ScheduleStatus.scheduled => ScheduleStatusWidget(
            text: "Você está escalado:",
            pathImage: "lib/core/assets/you_are_scheluded.png",),
        },
        DatesWidget(schedule: ScheduleMockup.myUser.scheduledDates),
      ],
    );
  }

   ScheduleStatus getUserScheduleStatus() {
    if (ScheduleMockup.myUser.availabilitySchedule.isEmpty) {
      return ScheduleStatus.noAvailability;
    } else if (ScheduleMockup.myUser.scheduledDates.isEmpty) {
      return ScheduleStatus.waitingForSchedule;
    } else {
      return ScheduleStatus.scheduled;
    }
  }
}