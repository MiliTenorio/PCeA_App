import 'package:flutter/material.dart';
import 'package:pcea_app/core/utils/AppColors.dart';
import 'package:pcea_app/features/schedule/presentation/pages/schedule_page.dart';

class AvailableOptionsWidget extends StatelessWidget {
  const AvailableOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Container(
              decoration: BoxDecoration(color: AppColors.yellow, borderRadius: BorderRadius.all(Radius.circular(20,),),),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SchedulePage()),
                    );
                  },
                  child: Text("Disponibilidade", 
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.white),
                  ),
                ),
              ),
            ),
          );
  }
}