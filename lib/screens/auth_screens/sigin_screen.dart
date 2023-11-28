import 'package:bhaladawala_app/custom_class/custom_elevated_button.dart';
import 'package:bhaladawala_app/custom_class/snack_bar.dart';
import 'package:bhaladawala_app/repo/sign_in_repo.dart';
import 'package:bhaladawala_app/custom_class/custom_Textfield_class.dart';
import 'package:bhaladawala_app/screens/auth_screens/forgot_password_screen.dart';
import 'package:bhaladawala_app/screens/auth_screens/signup_screen.dart';
import 'package:bhaladawala_app/screens/home_screens/bottom_sheet.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_fonts.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isChecked = false;
  bool toggleButton = true;
  bool isLoading = false;

  final SignInRepo signInRepo = SignInRepo();
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final loginButtonController = RoundedLoadingButtonController();
  final _formKey = GlobalKey<FormState>();


  void login(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();


    bool hasLoggedIn = prefs.getBool('hasLoggedIn') ?? false;

    if (!hasLoggedIn) {
      await prefs.setBool('hasLoggedIn', true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignUpScreen()),
      );
    } else {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomSheetScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.11,
                left: MediaQuery.of(context).size.width * 0.06),
            child: const Text(
              AppStrings.textSignIn,
              style: TextStyle(
                  color: AppColors.black,
                  fontFamily: AppFonts.fontInterBold,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.15),
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: loginEmailController,
                        hintText2: AppStrings.email,
                        hintText: AppStrings.enterEmail,
                      ),
                      CustomTextField(
                          obscure: toggleButton,
                          suffixIcon: true,
                          hintText: AppStrings.password,
                          hintText2: AppStrings.enterPassword,
                          controller: _passwordController,
                          onPressedOnToggle: () {
                            setState(() {
                              toggleButton = !toggleButton;
                            });
                          })
                    ],
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.05,
                              height:
                                  MediaQuery.of(context).size.height * 0.023,
                              decoration: BoxDecoration(
                                color: isChecked
                                    ? AppColors.black
                                    : AppColors.white,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: isChecked
                                      ? AppColors.black
                                      : AppColors.appColor,
                                  width: 2,
                                ),
                              ),
                              child: isChecked
                                  ? const Icon(
                                      Icons.check,
                                      color: AppColors.white,
                                      size: 16,
                                    )
                                  : null,
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02),
                          const Text(
                            AppStrings.textRememberMe,
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 14,
                              fontFamily: AppFonts.fontInterMedium,
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(width: MediaQuery.of(context).size.width * 0.25),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ResetPinScreen()),
                          );
                        },
                        child: const Text(
                          AppStrings.textForgotPassword,
                          style: TextStyle(
                            color: AppColors.appColor,
                            fontSize: 14,
                            fontFamily: AppFonts.fontInterMedium,
                          ),
                        ),
                      )
                    ]),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.023,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width,
                  child: CustomElevatedButton(
                    text: AppStrings.textSignIn,
                    onPressed: () async {


                      FocusManager.instance.primaryFocus?.unfocus();
                      String firstname = loginEmailController.text;
                      String password = _passwordController.text;
                      if (firstname.isEmpty) {
                        errorSnackBar('Enter Your Email');
                      } else if (password.isEmpty) {
                        errorSnackBar('Enter Password');
                      }
                      /* else if (!_passwordRegExp.hasMatch(password)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Enter valid password'),
                            //     duration: Duration(seconds: 1),
                          ),
                        );
                      }*/
                      else {
                        final responseMessage = await signInRepo.sigInRequest(
                            loginEmailController.text,
                            _passwordController.text,
                            '11',
                            '22');
                        if (responseMessage == AppStrings.success) {
                          navigation();
                        } else {
                          errorSnackBar(responseMessage.toString());
                        }
                      }
                    },
                    buttonColor: AppColors.appColor,
                    colorText: AppColors.white,
                    controller: loginButtonController,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.08,
                      left: MediaQuery.of(context).size.width * 0.01),
                  child: Text.rich(TextSpan(
                      style: const TextStyle(color: AppColors.grey),
                      children: [
                        const TextSpan(
                            text: AppStrings.textDoNotHaveAnAccount,
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: AppFonts.fontInterMedium,
                            )),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen()),
                                );
                              },
                            text: AppStrings.textSignUp,
                            style: const TextStyle(
                                fontSize: 16,
                                color: AppColors.appColor,
                                fontFamily: AppFonts.fontInterMedium,
                                fontWeight: FontWeight.bold))
                      ])),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    loginEmailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void navigation() {
    ReusableSnackBar.show(context, 'You are login successfully',
        isSuccess: true);
    // SharedPrefManager.shared.sharedPres.getBool(AppStrings.isAlreadyStoreAdded) != true
    //     ? Navigator.pushReplacement(context,
    //  MaterialPageRoute(builder: (context) => const AddStoreScreen()))
    //     :
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const BottomSheetScreen()));
  }

  void errorSnackBar(String message) {
    ReusableSnackBar.show(context, message);
  }
}

class Validator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    // Add more complex email validation logic if needed
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    // Add more password validation logic if needed
    return null;
  }
}
