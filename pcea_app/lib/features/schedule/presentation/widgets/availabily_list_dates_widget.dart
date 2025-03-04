import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:pcea_app/core/utils/AppColors.dart';
import 'package:pcea_app/features/schedule/data/datasources/schedule_mockup.dart';
import 'package:pcea_app/features/schedule/domain/entities/schedules.dart';
import 'package:pcea_app/features/schedule/presentation/stores/user_store.dart';

class AvailabilyListDatesWidget extends StatelessWidget {
  AvailabilyListDatesWidget({super.key});
  final UserStore userStore = Modular.get<UserStore>();

  final today = DateTime.now();

   @override
    Widget build(BuildContext context) {
      final List<Schedule> schedules = ScheduleMockup.schedules
        .map((schedule) => Schedule(
              month: schedule.month,
              selectedDates: schedule.selectedDates
                  .where((date) => !date.isBefore(today))
                  .toList()
                ..sort((a, b) => a.compareTo(b)),
            ))
        .where((schedule) => schedule.selectedDates.isNotEmpty)
        .toList();

      return Observer(
        builder: (_) {
          return ListView.separated(
            itemCount: schedules.length,
            itemBuilder: (context, index) {
              final schedule = schedules[index];
              return Theme(
                data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: Text(
                    schedule.month,
                    style: TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  childrenPadding: EdgeInsets.only(left: 10),
                  trailing: Icon(Icons.arrow_drop_down, color: AppColors.white),
                  children: schedule.selectedDates.map((date) {
                    return Observer(
                      builder: (_) {
                        return CheckboxListTile(
                          title: Text(
                            DateFormat('dd/MM/yy').format(date), 
                            style: TextStyle(color: AppColors.white, fontSize: 16),
                          ),
                          value: userStore.userAvailableDates.contains(date),
                          onChanged: (checked) {
                            userStore.toggleDateSelection(date);
                          },
                          activeColor: AppColors.white,
                          checkColor: AppColors.blue,
                          side: BorderSide(color: AppColors.white),
                        );
                      },
                    );
                  }).toList(),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(color: AppColors.white),
          );
        },
      );
  }
}
