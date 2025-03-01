import 'package:flutter/material.dart';
import 'package:pcea_app/features/schedule/domain/entities/schedules.dart';

class AvailableMonths extends StatefulWidget {
  AvailableMonths({super.key, required this.filteredSchedules, required this.selectedDates});

  List<Schedule> filteredSchedules;
  List<DateTime> selectedDates;

  @override
  State<AvailableMonths> createState() => _AvailableMonthsState();
}

class _AvailableMonthsState extends State<AvailableMonths> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                itemCount: widget.filteredSchedules.length,
                itemBuilder: (context, index) {
                  final schedule = widget.filteredSchedules[index];
                  return ExpansionTile(
                    title: Text(schedule.month),
                    children: schedule.selectedDates.map((date) {
                      return CheckboxListTile(
                        title: Text(date.toString().split(' ')[0]),
                        value: widget.selectedDates.contains(date),
                        onChanged: (checked) {
                          setState(() {
                            if (checked == true) {
                              widget.selectedDates.add(date);
                            } else {
                              widget.selectedDates.remove(date);
                            }
                          });
                        },
                      );
                    }).toList(),
                  );
                },
              );
  }
}