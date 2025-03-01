import 'package:flutter/material.dart';
import 'package:pcea_app/core/utils/AppColors.dart';
import 'package:pcea_app/core/utils/strings/Strings.dart';
import 'package:pcea_app/features/schedule/domain/entities/schedules.dart';
import 'package:pcea_app/features/schedule/presentation/widgets/title_widget.dart';
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
            Expanded(
              //change to a stlful widget using store to have the state
              child: Padding(
                padding: 
                EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1, 
                  vertical: MediaQuery.of(context).size.height * 0.03, ),
                 child: Container(
                   decoration: BoxDecoration(color: AppColors.blue, 
                borderRadius: BorderRadius.all(Radius.circular(20,),),),
                  child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: ListView.separated(
                      itemCount: filteredSchedules.length,
                      itemBuilder: (context, index) {
                        final schedule = filteredSchedules[index];
                        return ExpansionTile(
                          title: Text(schedule.month,
                          style: TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w600,),
                          ),
                          trailing: Icon(Icons.arrow_drop_down, color: AppColors.white,),
                          children: schedule.selectedDates.map((date) {
                            return CheckboxListTile(
                              title: Text(date.toString().split(' ')[0], style: TextStyle(color: AppColors.white, fontSize:14)),
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
                              activeColor: AppColors.white,
                              checkColor: AppColors.white,
                             tileColor:  Colors.yellow,

                            );
                          }).toList(),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(color: AppColors.white,);
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Container(
              decoration: BoxDecoration(color: AppColors.yellow, borderRadius: BorderRadius.all(Radius.circular(20,),),),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: TextButton(
                  onPressed: () { },
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