import 'package:bhaladawala_app/custom_class/custom_appbar.dart';
import 'package:bhaladawala_app/screens/home_screens/bottom_sheet.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_fonts.dart';
import 'package:bhaladawala_app/utils/app_image_assets.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MyCartEmptyScreen extends StatefulWidget {
  const MyCartEmptyScreen({super.key});

  @override
  State<MyCartEmptyScreen> createState() => _MyCartEmptyScreenState();
}

class _MyCartEmptyScreenState extends State<MyCartEmptyScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          appBarText: AppStrings.textMyCart,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.2,
              ),
              child: SvgPicture.asset(
                ImageAssets.cartIcon,
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width * 0.2,
              ),
            ),
            Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03,
                ),
                child: Text(AppStrings.textCartIsEmpty,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.032,
                      fontFamily: AppFonts.fontInterBold,
                    ))),
            Container(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * 0.02,
                  right: MediaQuery.of(context).size.height * 0.02,
                ),
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03,
                ),
                child: const Text(
                  textAlign: TextAlign.center,
                  AppStrings.textCartSubTitle,
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
              width: MediaQuery.of(context).size.height * 0.14,
              height: MediaQuery.of(context).size.height * 0.04,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.appColor,
                ),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomSheetScreen(),));
                },
                child: const Text(
                  AppStrings.textShopNow,
                  style: TextStyle(
                      fontSize: 14, fontFamily: AppFonts.fontInterMedium),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
