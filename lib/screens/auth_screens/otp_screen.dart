import 'package:bhaladawala_app/custom_class/custom_elevated_button.dart';
import 'package:bhaladawala_app/screens/auth_screens/reset_password.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_fonts.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpButtonController = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05,
                    left: MediaQuery.of(context).size.width * 0.04),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey.shade400),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: AppColors.black),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.057,
                    left: MediaQuery.of(context).size.width * 0.04),
                child: const Text(
                  AppStrings.text6Digit,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: AppFonts.fontInterBold,
                  ),
                ),
              )
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              AppStrings.textEmailDescription,
              style: TextStyle(
                fontSize: 16,
                fontFamily: AppFonts.fontInterRegular,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            OtpTextField(
              keyboardType: TextInputType.number,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              borderRadius: BorderRadius.circular(10),
              numberOfFields: 5,
              borderColor: AppColors.black,
              showFieldAsBox: true,
              disabledBorderColor: Colors.red,
              fieldWidth: 50.0,

              onCodeChanged: (pin) {
                // Handle OTP changes here
                // print("Changed: $pin");
              },

              onSubmit: (String verificationCode) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(AppStrings.verificationCode),
                        content: Text('Code entered is $verificationCode'),
                      );
                    });
              }, // end onSubmit
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width,
              child: CustomElevatedButton(
                text: AppStrings.textBtnVerify,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ResetPassword()));
                },
                buttonColor: AppColors.appColor,
                colorText: AppColors.white,
                controller: otpButtonController,
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.08),
              child: Text.rich(TextSpan(
                  style: const TextStyle(color: AppColors.grey),
                  children: [
                    TextSpan(
                        text: AppStrings.textDidntReceiveACode,
                        style: TextStyle(
                          color: AppColors.greyShade800,
                          fontSize: 16,
                          fontFamily: AppFonts.fontInterMedium,
                        )),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ResetPassword()),
                            );
                          },
                        text: AppStrings.textResend,
                        style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.appColor,
                            fontFamily: AppFonts.fontInterMedium,
                            fontWeight: FontWeight.bold))
                  ])),
            ),
          ]),
        ),
      ),
    );
  }
}
