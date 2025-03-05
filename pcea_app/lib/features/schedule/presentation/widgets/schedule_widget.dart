import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pcea_app/core/utils/AppColors.dart';
import 'package:pcea_app/core/utils/strings/Enums.dart';
import 'package:pcea_app/features/schedule/presentation/stores/user_store.dart';
import 'package:pcea_app/features/schedule/presentation/widgets/dates_widget.dart';
import 'package:pcea_app/features/schedule/presentation/widgets/schedule_status_widget.dart';

class ScheduleWidget extends StatelessWidget {
  ScheduleWidget({super.key});
  final UserStore userStore = Modular.get<UserStore>();


  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
          userStore.getScheduledDates();
          final status = userStore.scheduleStatus;

        return Padding(
          padding: _getPadding(status, context),
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
                              ScheduleStatusWidget(text: _getStatusMessage(status), pathImage: _getStatusImage(status)),
                              if (status == ScheduleStatus.scheduled)
                                  DatesWidget(/*schedule: userStore.user.scheduledDates*/),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
      }
    );
  }

  EdgeInsets _getPadding(ScheduleStatus status, BuildContext context) {
    return (status == ScheduleStatus.scheduled)
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
                );
  }

  String _getStatusMessage(ScheduleStatus status) {
    switch (status) {
        case ScheduleStatus.noAvailability:
          return "Você ainda não informou quais datas está disponível!";
        case ScheduleStatus.waitingForSchedule:
          return "Você ainda não foi escalado(a)\nAguarde!";
        case ScheduleStatus.scheduled:
          return "Você está escalado:";
      }
  }

  String _getStatusImage(ScheduleStatus status) {
    switch (status) {
      case ScheduleStatus.noAvailability:
        return "lib/core/assets/waiting_availabity.png";
      case ScheduleStatus.waitingForSchedule:
        return "lib/core/assets/wait_for_scheluded.png";
      case ScheduleStatus.scheduled:
        return "lib/core/assets/you_are_scheluded.png";
    }
  }

}

