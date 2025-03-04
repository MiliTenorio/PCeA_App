import 'package:flutter/cupertino.dart';
import 'package:pcea_app/core/utils/AppColors.dart';
import 'package:pcea_app/features/schedule/presentation/widgets/availabily_list_dates_widget.dart';

class MonthsOptionsWidget extends StatelessWidget {
  const MonthsOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                      child: AvailabilyListDatesWidget(),
                  ),
                ),
              ),
            );
  }
}