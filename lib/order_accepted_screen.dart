import 'package:bhaladawala_app/custom_class/custom_elevated_button.dart';
import 'package:bhaladawala_app/order_failed.dart';
import 'package:bhaladawala_app/screens/home_screens/bottom_sheet.dart';
import 'package:bhaladawala_app/screens/my_cart/my_cart.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_fonts.dart';
import 'package:bhaladawala_app/utils/app_image_assets.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderAcceptedScreen extends StatelessWidget {
  const OrderAcceptedScreen({super.key});

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
                  ImageAssets.orderAcceptedIcon,
                  height: MediaQuery.of(context).size.height * 0.18,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                    left: MediaQuery.of(context).size.height * 0.03,
                    right: MediaQuery.of(context).size.height * 0.03,
                  ),
                  child: const Text(
                      textAlign: TextAlign.center,
                      AppStrings.textOrderAccepted,
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: AppFonts.fontInterBold,
                      ))),
              Container(
                  margin: EdgeInsets.only(

                    top: MediaQuery.of(context).size.height * 0.02,
                    left: MediaQuery.of(context).size.height * 0.03,
                    right: MediaQuery.of(context).size.height * 0.03,
                  ),
                  child:  const Text(
                    textAlign: TextAlign.center,
                    AppStrings.textOrderAcceptedSubtitle,
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 19,
                      fontFamily: AppFonts.fontInterRegular,
                    ),
                  )),
            ],
          ),
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.2,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  CustomElevatedButton(
                      text: AppStrings.textTrackOrder,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const MyCartEmptyScreen()),
                        );
                      }, buttonColor: AppColors.appColor, colorText: AppColors.white, ),
                   SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02
                  ),
                  CustomElevatedButton(
                      text: AppStrings.textBackToHome,
                      isBackGroundWhite: true,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const BottomSheetScreen()),
                        );
                      }, buttonColor: AppColors.white, colorText: AppColors.black, ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
