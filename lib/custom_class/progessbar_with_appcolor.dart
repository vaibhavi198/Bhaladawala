import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProgressBarWithAppColor extends StatelessWidget {
  const ProgressBarWithAppColor({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: SizedBox(
      height: 15,
      width: 15,
      child: CircularProgressIndicator(
        color: AppColors.appColor,
        strokeWidth: 2,
      ),
    ));
  }
}
