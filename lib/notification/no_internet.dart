import 'package:bhaladawala_app/custom_class/custom_elevated_button.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_fonts.dart';
import 'package:bhaladawala_app/utils/app_image_assets.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.3,
                left: MediaQuery.of(context).size.height * 0.01),
            child: SvgPicture.asset(
              ImageAssets.noWifiIcon,
              height: MediaQuery.of(context).size.height * 0.08,
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03,
                  left: MediaQuery.of(context).size.height * 0.01),
              child: const Text(
                  textAlign: TextAlign.center,
                  AppStrings.textNoWifi,
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: AppFonts.fontInterBold,
                  ))),
          Container(
              padding: const EdgeInsets.all(15),
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.0002,
              ),
              child: const Text(
                textAlign: TextAlign.center,
                AppStrings.textNoOrderPlacedSubTitle,
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 16,
                  fontFamily: AppFonts.fontInterRegular,
                ),
              )),
          Container(
            decoration: BoxDecoration(
                color: AppColors.appColor,
                borderRadius: BorderRadius.circular(5)),
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.03,

            ),
            width:
            MediaQuery.of(context).size.height * 0.16,
            height:
            MediaQuery.of(context).size.height * 0.05,
            child: CustomElevatedButton(
                text: AppStrings.textTryAgain,
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) =>
                  //       const SignInScreen()),
                  // );
                }, buttonColor: AppColors.appColor, colorText: AppColors.white,
                ),
          ),
        ],
      ),
    );
  }
}
