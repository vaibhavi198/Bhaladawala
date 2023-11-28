import 'package:bhaladawala_app/custom_class/custom_Textfield_class.dart';
import 'package:bhaladawala_app/custom_class/custom_elevated_button.dart';
import 'package:bhaladawala_app/custom_class/snack_bar.dart';
import 'package:bhaladawala_app/repo/profile_repo.dart';
import 'package:bhaladawala_app/repo/reset_pin_repo.dart';
import 'package:bhaladawala_app/screens/auth_screens/sigin_screen.dart';
import 'package:bhaladawala_app/shared_preference/shared_preference_manager.dart';
import 'package:flutter/material.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';
import 'package:bhaladawala_app/utils/app_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool oldPasswordToggle = true;
  bool newPasswordToggleButton = true;
  bool confirmPasswordToggleButton = true;
  bool isLoading = false;
  final resetPinButtonController = RoundedLoadingButtonController();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final RegExp _passwordRegExp =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  final ResetPinRepo resetPinRepo = ResetPinRepo();
  final profileRepo = ProfileRepo();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  top: MediaQuery.of(context).size.height * 0.02,
                ),
                child: const Text(
                  AppStrings.textRestPin,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: AppFonts.fontInterBold,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              CustomTextField(
                obscure: oldPasswordToggle,
                onPressedOnToggle: () {
                  setState(() {
                    oldPasswordToggle = !oldPasswordToggle;
                  });
                },
                suffixIcon: true,
                controller: oldPasswordController,
                hintText2: AppStrings.oldPassword,
                hintText: AppStrings.oldPassword,
              ),
              CustomTextField(
                obscure: newPasswordToggleButton,
                onPressedOnToggle: () {
                  setState(() {
                    newPasswordToggleButton = !newPasswordToggleButton;
                  });
                },
                suffixIcon: true,
                controller: newPasswordController,
                hintText2: AppStrings.newPassword,
                hintText: AppStrings.newPassword,
              ),
              CustomTextField(
                obscure: confirmPasswordToggleButton,
                onPressedOnToggle: () {
                  setState(() {
                    confirmPasswordToggleButton = !confirmPasswordToggleButton;
                  });
                },
                suffixIcon: true,
                controller: confirmPasswordController,
                hintText2: AppStrings.confirmPassword,
                hintText: AppStrings.confirmPassword,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width,
                child: CustomElevatedButton(
                  text: AppStrings.textBtnResetPin,
                  onPressed: () async {
                    String oldPassword = oldPasswordController.text;
                    String newPassword = newPasswordController.text;
                    String confirmPassword = confirmPasswordController.text;

                    if (oldPassword.isEmpty) {
                      errorSnackBar('Enter Old Password First');
                    } else if (newPassword.isEmpty) {
                      errorSnackBar('Enter New Password First');
                    }
                    /*else if (!_passwordRegExp.hasMatch(newPassword)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Password Should be of 8 characters'),
                            //     duration: Duration(seconds: 1),
                          ),
                        );
                      }*/
                    else if (newPassword != confirmPassword) {
                      errorSnackBar('New and confirm password are not same');
                    } else {
                      setState(() {
                        isLoading = true;
                      });

                      print(oldPassword);
                      print(confirmPassword);

                      final message = await profileRepo.changePassword(
                        oldPassword,
                        confirmPassword,
                      );

                      setState(() {
                        isLoading = false;
                      });

                      print("Message::$message");
                      if (message == "1") {
                        successSnackBar();
                      } else {
                        errorSnackBar(message);
                      }
                      navigation();
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
      ),
    );
  }

  void errorSnackBar(String message) {
    ReusableSnackBar.show(context, message);
  }

  void successSnackBar() {
    ReusableSnackBar.show(
        context, 'Your password has been changed successfully',
        isSuccess: true);
  }

  void navigation() {
    if (SharedPrefManager.shared.sharedPres.getString(AppStrings.token) != '' &&
        SharedPrefManager.shared.sharedPres.getString(AppStrings.token) !=
            null) {
      Navigator.of(context).pop();
      /* Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const BottomSheetScreen(),
      ));*/
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const SignInScreen(),
      ));
    }
  }
}
