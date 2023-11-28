import 'dart:async';
import 'package:bhaladawala_app/screens/auth_screens/sigin_screen.dart';
import 'package:bhaladawala_app/screens/home_screens/bottom_sheet.dart';
import 'package:bhaladawala_app/screens/home_screens/home_bottom_nav_bar.dart';
import 'package:bhaladawala_app/screens/home_screens/tabs/home_screen.dart';
import 'package:bhaladawala_app/screens/splash_screen/intro_screen.dart';
import 'package:bhaladawala_app/shared_preference/shared_preference_manager.dart';
import 'package:bhaladawala_app/utils/app_image_assets.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();


    Timer(const Duration(seconds: 3), () {
      if(SharedPrefManager.shared.sharedPres.getString(AppStrings.token) != '' &&
          SharedPrefManager.shared.sharedPres.getString(AppStrings.token) != null){
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const BottomSheetScreen(),
        ));

      }else {
        if(SharedPrefManager.shared.sharedPres.getBool(AppStrings.isFirstTime) != true){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const IntroScreen(),
          ));
        }else{
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const SignInScreen(),
          ));
        }

      }

    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              padding: const EdgeInsets.all(55),
              child: Image.asset(ImageAssets.splashScreenImage))),
    );
  }
}
