import 'package:flutter/material.dart';
import 'package:pcea_app/core/utils/AppColors.dart';
import 'package:pcea_app/core/utils/strings/Enums.dart';
import 'package:pcea_app/features/schedule/data/datasources/schedule_mockup.dart';
import 'package:pcea_app/features/schedule/presentation/widgets/dates_widget.dart';
import 'package:pcea_app/features/schedule/presentation/widgets/schedule_status_widget.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ScheduleStatus status = getUserScheduleStatus();
    
    return Padding(
      padding: (status == ScheduleStatus.scheduled)
      ? EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02, 
          vertical: MediaQuery.of(context).size.height * 0.01, 
        )
      : (status == ScheduleStatus.waitingForSchedule)
          ? EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
              vertical: MediaQuery.of(context).size.height * 0.09, 
            )
          : EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
              vertical: MediaQuery.of(context).size.height * 0.1, 
            ),
              child: Container(
                decoration: BoxDecoration(color: AppColors.blue, 
                borderRadius: BorderRadius.all(Radius.circular(20,),),),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Column(
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
                      ),
                    ],
                  ),
                ),
              ),
            )
     ;
  }

   ScheduleStatus getUserScheduleStatus() {
    if (ScheduleMockup.myUser.availableDates.isEmpty) {
      return ScheduleStatus.noAvailability;
    } else if (ScheduleMockup.myUser.scheduledDates.isEmpty) {
      return ScheduleStatus.waitingForSchedule;
    } else {
      return ScheduleStatus.scheduled;
    }
  }
}