import 'package:bhaladawala_app/screens/auth_screens/sigin_screen.dart';
import 'package:bhaladawala_app/shared_preference/shared_preference_manager.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_image_assets.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:bhaladawala_app/utils/app_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final introSplashButtonController = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.4),
              padding: const EdgeInsets.all(60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.22),
                      child: Image.asset(
                        ImageAssets.storeImage,
                        height: MediaQuery.of(context).size.height * 0.12,
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Image.asset(ImageAssets.splashScreenImage),
                ],
              )),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.09,
            ),
            child: const Text(
              AppStrings.textIntroWelcome,
              style: TextStyle(
                fontSize: 27,
                fontFamily: AppFonts.fontInterBold,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Text(
              AppStrings.textIntroGrocery,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontFamily: AppFonts.fontInterBold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
              left: MediaQuery.of(context).size.height * 0.02,
              right: MediaQuery.of(context).size.height * 0.02,
            ),
            child:  Text(
              AppStrings.textIntroText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black.withOpacity(0.7),
                fontFamily: AppFonts.fontInterMedium,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
              ),
              child: ElevatedButton(
                onPressed: () {
                  SharedPrefManager.shared.sharedPres
                      .setBool(AppStrings.isFirstTime, true);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape:
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),

                  backgroundColor: AppColors.appColor,
                ),
                child:
                const Text(
                  "Next",
                  style: TextStyle(fontSize: 18),
                ),
              )

              /*CustomElevatedButton(

                text: AppStrings.textIntroBtnNext,
                onPressed: () {
                  SharedPrefManager.shared.sharedPres.setBool(AppStrings.isFirstTime, true);
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const SignInScreen()),
                  );
                },
              buttonColor: AppColors.appColor, colorText: AppColors.white, controller: null, ),*/
              ),
        ],
      ),
    );
  }
}
