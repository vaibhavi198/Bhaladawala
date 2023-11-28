import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:flutter/material.dart';



class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.grey,
      height: MediaQuery.of(context).size.height * 0.004,
      thickness: 0.3,
    );
  }
}
