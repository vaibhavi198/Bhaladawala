import 'package:bhaladawala_app/custom_class/custom_Textfield_class.dart';
import 'package:bhaladawala_app/custom_class/custom_appbar.dart';
import 'package:bhaladawala_app/custom_class/custom_elevated_button.dart';
import 'package:bhaladawala_app/custom_class/snack_bar.dart';
import 'package:bhaladawala_app/repo/forgot_password_repo.dart';
import 'package:bhaladawala_app/screens/auth_screens/otp_screen.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_fonts.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ResetPinScreen extends StatefulWidget {
  const ResetPinScreen({super.key});

  @override
  State<ResetPinScreen> createState() => _ResetPinScreenState();
}

class _ResetPinScreenState extends State<ResetPinScreen> {
  final resetPinButtonController = RoundedLoadingButtonController();
  final TextEditingController _emailController = TextEditingController();
  final RegExp _emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final ForgotPasswordRepo forgotRepo = ForgotPasswordRepo();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      /*  appBar: const CustomAppBar(
          appBarText:  AppStrings.textRestPin,
        ),*/

      /*  appBar: AppBar(
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
                    top: MediaQuery.of(context).size.height * 0.04,
                    left: MediaQuery.of(context).size.width * 0.04),
                child: const Text(
                  AppStrings.textRestPin,
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
        ),*/
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03,

              ),
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
                  top: MediaQuery.of(context).size.height * 0.04,

              ),
              child: const Text(
                AppStrings.textRestPin,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: AppFonts.fontInterBold,
                ),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            CustomTextField(
              controller: _emailController,
              hintText2: AppStrings.enterEmailAddress,
              hintText: AppStrings.emailAddress,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width,
              child: CustomElevatedButton(
                text: AppStrings.textBtnVerify,
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  String email = _emailController.text;

                  if (!_emailRegExp.hasMatch(email)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Enter valid Email'),
                        //     duration: Duration(seconds: 1),
                      ),
                    );
                  } else {
                    final responseMessage =
                        await forgotRepo.forgotPasswordRequest(
                      _emailController.text,
                    );
                    if (responseMessage == AppStrings.success) {
                      successSnackBar('You are register successfully');
                      navigation();
                    } else {
                      errorSnackBar(responseMessage);
                    }
                  }
                },
                buttonColor: AppColors.appColor,
                colorText: AppColors.white,
                controller: resetPinButtonController,
              ),
            ),
          ]),
        ),
      ),
    );
  }
  void  successSnackBar(String message) {
    ReusableSnackBar.show(context, message,
        isSuccess: true);
  }

  void errorSnackBar(String message) {
    ReusableSnackBar.show(context, message);
  }
  void navigation() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const OtpScreen()));
  }
}
