import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color buttonColor;
  bool isBackGroundWhite;
  final Color colorText;
  final RoundedLoadingButtonController? controller;

   CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.buttonColor,
    required this.colorText,
    this.isBackGroundWhite  = false,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
      curve: Curves.bounceIn,
      color: !isBackGroundWhite ? AppColors.appColor : AppColors.white,
      onPressed: onPressed,
      resetAfterDuration: true,
      borderRadius: 10,
      successIcon: Icons.check,
      successColor: AppColors.appColor,
      resetDuration: const Duration(seconds: 4),
      controller: controller ?? RoundedLoadingButtonController(),
      child: Container(
        decoration: BoxDecoration(
          // color: AppColors.appColor,
          borderRadius: BorderRadius.circular(10),
        ),
        // constraints:  BoxConstraints(
        //   maxWidth: MediaQuery.of(context).size.width * 2,
        //   minHeight: 35,
        // ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: colorText,
              fontSize: 18,
              fontFamily: AppFonts.fontInterMedium,
            ),
          ),
        ),
      ),
    );
  }
}

// SizedBox(
// height: MediaQuery.of(context).size.height * 0.05 ,
// width: MediaQuery.of(context).size.width ,
// child: ElevatedButton(
// onPressed: onPressed,
// style: ElevatedButton.styleFrom(
// shape:
// RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
// backgroundColor: buttonColor,
// ),
// child: Text(
// text,
// style:  TextStyle(
// color: colorText,
// fontSize: 16,
// fontFamily: AppFonts.fontInterMedium,
// ),
// )),
// );
