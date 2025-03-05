import 'package:flutter/material.dart';
import 'package:pcea_app/core/utils/AppColors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isFirstRoute = ModalRoute.of(context)?.isFirst ?? true;

    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0, 
      leading: isFirstRoute
          ? null
          : IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.orange),
              onPressed: () => Navigator.of(context).pop(),
            ),
      flexibleSpace: SafeArea(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: isFirstRoute ? 16.0 : 36.0),
            child: Image.asset(
              'lib/core/assets/logo_pcea_new.png',
              width: 280,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}