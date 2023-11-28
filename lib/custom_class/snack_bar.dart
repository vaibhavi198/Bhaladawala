import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ReusableSnackBar {


  static void show(BuildContext context, String message,
      {bool isSuccess = false}) {


    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isSuccess? AppColors.green : AppColors.red,
        duration: const Duration(seconds: 3), // Adjust the duration as needed
      ),
    );
  }


}