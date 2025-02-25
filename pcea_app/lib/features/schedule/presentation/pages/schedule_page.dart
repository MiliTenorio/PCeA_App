import 'package:flutter/material.dart';
import 'package:pcea_app/core/utils/strings/Strings.dart';
import 'package:pcea_app/features/schedule/domain/entities/schedules.dart';
import '../../data/datasources/schedule_mockup.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  List<DateTime> selectedDates = [];
  List<Schedule> schedules = ScheduleMockup().schedules;

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();
    final currentMonthName = getMonthName(currentDate.month);

    final filteredSchedules = schedules.where((schedule) {
      final scheduleMonthName = schedule.month;

      return _compareMonths(scheduleMonthName, currentMonthName);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Disponibilidade')),
      body: Column(
        children: [
          Text('Selecione sua disponibilidade'),
          Expanded(
            child: ListView.builder(
              itemCount: filteredSchedules.length,
              itemBuilder: (context, index) {
                final schedule = filteredSchedules[index];
                return ExpansionTile(
                  title: Text(schedule.month),
                  children: schedule.selectedDates.map((date) {
                    return CheckboxListTile(
                      title: Text(date.toString().split(' ')[0]),
                      value: selectedDates.contains(date),
                      onChanged: (checked) {
                        setState(() {
                          if (checked == true) {
                            selectedDates.add(date);
                          } else {
                            selectedDates.remove(date);
                          }
                        });
                      },
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

   String getMonthName(int month) {
    const monthNames = Strings.months;
    return monthNames[month - 1];
  }

  bool _compareMonths(String scheduleMonthName, String currentMonthName) {
    final scheduleMonthIndex = getMonthIndex(scheduleMonthName);
    final currentMonthIndex = getMonthIndex(currentMonthName);

    return scheduleMonthIndex >= currentMonthIndex;
  }

  int getMonthIndex(String monthName) {
    const monthNames = Strings.months;
    return monthNames.indexOf(monthName);
  }
}