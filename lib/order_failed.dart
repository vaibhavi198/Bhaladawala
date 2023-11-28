import 'package:bhaladawala_app/custom_class/custom_elevated_button.dart';
import 'package:bhaladawala_app/screens/home_screens/bottom_sheet.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_fonts.dart';
import 'package:bhaladawala_app/utils/app_image_assets.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

  class OrderFailedScreen extends StatefulWidget {
  const OrderFailedScreen({super.key});

  @override
  State<OrderFailedScreen> createState() => _OrderFailedScreenState();
}

class _OrderFailedScreenState extends State<OrderFailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.25,
                ),
                child: SvgPicture.asset(
                  ImageAssets.orderFailedIcon,
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                  ),
                  child: const Text(
                      textAlign: TextAlign.center,
                      AppStrings.textOrderFailed,
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: AppFonts.fontInterBold,
                      ))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01,
                      left: MediaQuery.of(context).size.height * 0.01,
                      right: MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: const Text(
                      textAlign: TextAlign.center,
                      AppStrings.textNoOrderPlacedSubTitle,
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 18,
                        fontFamily: AppFonts.fontInterRegular,
                      ),
                    )),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
            child: Column(
              children: [
                Container(

                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.2,
                  ),
                  child: CustomElevatedButton(
                      text: AppStrings.textTryAgainOrder,
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) =>
                        //       const SignInScreen()),
                        // );
                      }, buttonColor:AppColors.appColor, colorText: AppColors.white,  ),
                ),
                 SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                CustomElevatedButton(
                    text: AppStrings.textBackToHome,
                    isBackGroundWhite: true,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const BottomSheetScreen()),
                      );
                    },buttonColor: AppColors.white, colorText: AppColors.black,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
