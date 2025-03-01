import 'package:flutter/material.dart';
import 'package:pcea_app/core/utils/AppColors.dart';

class ScheduleStatusWidget extends StatelessWidget {
  ScheduleStatusWidget({super.key, required this.text, required this.pathImage,});
  String text;
  String pathImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w600,),
        ),
        SizedBox(height: 15,),
        Image.asset(
          pathImage,
          width: 150,
          height: 150,
        ),
        SizedBox(height: 18,),
       ],
      );
  }
}