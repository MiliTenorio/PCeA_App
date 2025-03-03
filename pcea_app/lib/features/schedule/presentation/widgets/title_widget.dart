import 'package:flutter/material.dart';
import 'package:pcea_app/core/utils/AppColors.dart';

class TitleWidget extends StatelessWidget {
  TitleWidget({super.key, required this.title});
  String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Container(
              decoration: BoxDecoration(color: AppColors.purple, borderRadius: BorderRadius.all(Radius.circular(20,),),),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
  }
}