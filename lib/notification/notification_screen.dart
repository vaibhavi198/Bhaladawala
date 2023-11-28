import 'package:bhaladawala_app/custom_class/custom_appbar.dart';
import 'package:bhaladawala_app/screens/home_screens/bottom_sheet.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_fonts.dart';
import 'package:bhaladawala_app/utils/app_image_assets.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(appBarText: AppStrings.textNotification,  appBarBackArrow: true,),
        body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2, ),
              child: SvgPicture.asset(
                ImageAssets.notificationIcon,
                height: MediaQuery.of(context).size.height * 0.12, width:MediaQuery.of(context).size.width * 0.2,

              ),
            ),
            Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03, ),
                child: const Text(AppStrings.textNoNotification,style: TextStyle(
                  fontSize: 22,
                  fontFamily: AppFonts.fontInterBold,
                ))),
            Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03,
                  left: MediaQuery.of(context).size.height * 0.05,
                  right: MediaQuery.of(context).size.height * 0.05,
                ),
                child: const Text(
                  textAlign:  TextAlign.center,
                  AppStrings.textCartSubTitle,
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 16,
                    fontFamily: AppFonts.fontInterRegular,
                  ), )),

            Container(
              decoration: BoxDecoration(
                  color: AppColors.appColor,
                  borderRadius: BorderRadius.circular(5)),
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.03,

              ),
              width:
              MediaQuery.of(context).size.height * 0.18,
              height:
              MediaQuery.of(context).size.height * 0.05,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.appColor,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const BottomSheetScreen( )));
                },
                child:  const Text(
                  AppStrings.textBackToHome,
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily:
                      AppFonts.fontInterMedium),
                ),
              ),
            )
          ],
        ),


      ),
    );
  }
}
