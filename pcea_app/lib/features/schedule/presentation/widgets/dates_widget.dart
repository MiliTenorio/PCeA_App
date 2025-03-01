import 'package:flutter/material.dart';
import 'package:pcea_app/core/utils/AppColors.dart';
import 'package:pcea_app/features/schedule/domain/entities/schedules.dart';

class DatesWidget extends StatelessWidget {
  DatesWidget({super.key, required this.schedule});
  List<Schedule> schedule;

@override
  Widget build(BuildContext context) {
    if (schedule.isEmpty) return SizedBox.shrink();

    final List<DateTime> allDates = schedule.expand((s) => s.selectedDates).toList();

    return SizedBox(
      height: 150,
      width: 150,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: allDates.length,
        itemBuilder: (context, index) {
          final date = allDates[index];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "${date.day.toString().padLeft(2, '0')}/"
              "${date.month.toString().padLeft(2, '0')}/"
              "${date.year.toString().substring(2)}", // dd/mm/aa
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.blue, fontSize: 16, fontWeight: FontWeight.w400,),
            ),
          );
        },
      ),
    );
  }
}