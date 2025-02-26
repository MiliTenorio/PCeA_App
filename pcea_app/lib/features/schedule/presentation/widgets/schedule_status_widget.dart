import 'package:flutter/material.dart';

class ScheduleStatusWidget extends StatelessWidget {
  ScheduleStatusWidget({super.key, required this.text, required this.pathImage});
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
        ),
        Image.asset(
          pathImage,
          width: 300,
          height: 300,
        ),
       ],
      );
  }
}