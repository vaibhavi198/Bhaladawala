import 'package:bhaladawala_app/custom_class/custom_Textfield_class.dart';
import 'package:bhaladawala_app/custom_class/custom_elevated_button.dart';
import 'package:bhaladawala_app/custom_class/snack_bar.dart';
import 'package:bhaladawala_app/repo/sign_up_repo.dart';
import 'package:bhaladawala_app/screens/auth_screens/add_store_screen.dart';
import 'package:bhaladawala_app/screens/auth_screens/sigin_screen.dart';
import 'package:bhaladawala_app/screens/home_screens/bottom_sheet.dart';
import 'package:bhaladawala_app/shared_preference/shared_preference_manager.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_fonts.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChecked = false;
  bool passwordToggle = true;
  bool pinToggle = true;

  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};

  final SignUpRepo signUpRepo = SignUpRepo();
  final signInButtonController = RoundedLoadingButtonController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _addStoreController = TextEditingController();
  final TextEditingController _storeAddressController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _countryPinController = TextEditingController();
  final RegExp _emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async  {
    Map<String, dynamic>? deviceData = <String, dynamic>{};

    try {
      deviceData = switch (defaultTargetPlatform) {
        TargetPlatform.android =>
          _readAndroidBuildData(await deviceInfoPlugin.androidInfo),
        TargetPlatform.iOS =>
          _readIosDeviceInfo(await deviceInfoPlugin.iosInfo),
        TargetPlatform.fuchsia => <String, dynamic>{
            'Error:': 'Fuchsia platform isn\'t supported'
          },
        // TODO: Handle this case.
        TargetPlatform.linux => null,
        // TODO: Handle this case.
        TargetPlatform.macOS => null,
        // TODO: Handle this case.
        TargetPlatform.windows => null,
      };
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    if (!mounted) return;

    setState(() {
      _deviceData = deviceData!;
    });
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'systemFeatures': build.systemFeatures,
      'displaySizeInches':
          ((build.displayMetrics.sizeInches * 10).roundToDouble() / 10),
      'displayWidthPixels': build.displayMetrics.widthPx,
      'displayWidthInches': build.displayMetrics.widthInches,
      'displayHeightPixels': build.displayMetrics.heightPx,
      'displayHeightInches': build.displayMetrics.heightInches,
      'displayXDpi': build.displayMetrics.xDpi,
      'displayYDpi': build.displayMetrics.yDpi,
      'serialNumber': build.serialNumber,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.10,
                left: MediaQuery.of(context).size.width * 0.05),
            child: const Text(
              AppStrings.textSignUp,
              style: TextStyle(
                  color: AppColors.black,
                  fontFamily: AppFonts.fontInterBold,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                            controller: _firstNameController,
                            hintText2: AppStrings.enterFirstName,
                            hintText: AppStrings.firstName),
                        CustomTextField(
                          controller: _lastNameController,
                          hintText: AppStrings.lastName,
                          hintText2: AppStrings.enterLastName,
                        ),
                        CustomTextField(
                          controller: _emailController,
                          hintText2: AppStrings.enterEmailAddress,
                          hintText: AppStrings.emailAddress,
                        ),
                        CustomTextField(
                          obscure: passwordToggle,
                          suffixIcon: true,
                          controller: _passwordController,
                          hintText2: AppStrings.enterPassword,
                          hintText: AppStrings.password,
                          onPressedOnToggle: () {
                            setState(() {
                              passwordToggle = !passwordToggle;
                            });
                          },
                        ),
                        const Text(
                          AppStrings.textPhoneNumber,
                          style: TextStyle(
                              fontFamily: AppFonts.fontInterMedium,
                              fontSize: 14),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        IntlPhoneField(
                          controller: _mobileNumberController,
                          decoration: InputDecoration(
                            labelText: AppStrings.textPhoneNumber,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                              borderSide: const BorderSide(),
                            ),
                          ),
                          initialCountryCode: 'IN',
                          onChanged: (PhoneNumber phone) {
                            _countryPinController.text = phone.countryCode;
                          },
                          onCountryChanged: (value) {},
                        ),
                        CustomTextField(
                          controller: _addStoreController,
                          hintText2: AppStrings.textAddStore,
                          hintText: AppStrings.textAddStore,
                        ),
                        CustomTextField(
                          controller: _storeAddressController,
                          hintText2: AppStrings.storeAddress,
                          hintText: AppStrings.storeAddress,
                        ),
                        CustomTextField(
                            obscure: pinToggle,
                            suffixIcon: true,
                            hintText: AppStrings.pin,
                            controller: _pinController,
                            hintText2: AppStrings.enter4DigitPin,
                            onPressedOnToggle: () {
                              setState(() {
                                pinToggle = !pinToggle;
                              });
                            }),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width,
                      child: CustomElevatedButton(
                        text: AppStrings.textSignUp,
                        onPressed: () async {
                          String fname = _firstNameController.text;
                          String lastname = _lastNameController.text;
                          String email = _emailController.text;
                          String mobileNumber = _mobileNumberController.text;
                          String addStore = _addStoreController.text;
                          String storeAddress = _storeAddressController.text;
                          String pin = _pinController.text;
                          String countryPin = _countryPinController.text;

                          print('fname: $fname,');
                          print('lastname: $lastname,');
                          print('Email: $email,');
                          print('mobileNumber: $mobileNumber,');
                          print('addStore: $addStore,');
                          print('storeAddress: $storeAddress,');
                          print('pin: $pin,');
                          print('countryPin: $countryPin,');

                          if (fname.isEmpty) {
                            errorSnackBar('Enter Your First Name');
                          } else if (lastname.isEmpty) {
                            errorSnackBar('Enter Your Last Name');
                          } else if (!_emailRegExp.hasMatch(email)) {
                            errorSnackBar('Enter Your Email');
                          }
                          // if(mobileNumber.isEmpty ){
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(
                          //       content: Text('Enter mobile number name'),
                          //       duration: Duration(seconds: 1),
                          //     ),
                          //   );
                          // }
                          else if (addStore.isEmpty) {
                            errorSnackBar('Enter add store');
                          } else if (storeAddress.isEmpty) {
                            errorSnackBar('Enter Store Address');
                          } else if (pin.isEmpty) {
                            errorSnackBar('Enter Pin');
                          } else {
                            final isRegister = await signUpRepo.signUpRequest(
                                _firstNameController.text,
                                _lastNameController.text,
                                _emailController.text,
                                _passwordController.text,
                                _mobileNumberController.text,
                                _addStoreController.text,
                                _storeAddressController.text,
                                _pinController.text,
                                _countryPinController.text);

                            if (isRegister == '1') {
                              print(isRegister);
                              successSnackBar(
                                  "'You are register successfully'");
                              navigationToLoginScreen();
                            } else {
                              errorSnackBar(isRegister);
                            }
                          }
/*
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          bool isNewUser = prefs.getBool('isNewUser') ?? true;

                          if (isNewUser) {
                            // Navigate to SignUpScreen for new users
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUpScreen()),
                            );
                          } else {
                            // Navigate to HomeScreen for existing users
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BottomSheetScreen()),
                            );
                          }*/
                        },
                        buttonColor: AppColors.appColor,
                        colorText: AppColors.white,
                        controller: signInButtonController,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.width * 0.04,
                          top: MediaQuery.of(context).size.width * 0.04,
                          left: MediaQuery.of(context).size.width * 0.01),
                      child: Text.rich(TextSpan(
                          style: const TextStyle(color: AppColors.grey),
                          children: [
                            const TextSpan(
                                text: AppStrings.textAlreadyHaveAnAccount,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppFonts.fontInterMedium,
                                )),
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    navigationToLoginScreen();
                                  },
                                text: AppStrings.textSignIn,
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
            ),
          ),
        ],
      ),
    );
  }

  void navigationToLoginScreen() {

    ReusableSnackBar.show(context, 'You are login successfully',
        isSuccess: true);
    SharedPrefManager.shared.sharedPres.getBool(AppStrings.isAlreadyStoreAdded) != true
        ? Navigator.pushReplacement(context,
     MaterialPageRoute(builder: (context) => const AddStoreScreen()))
        :
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const BottomSheetScreen()));
    //
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const BottomSheetScreen()),
    // );
  }

  void successSnackBar(String message) {
    ReusableSnackBar.show(context, message, isSuccess: true);
  }

  void errorSnackBar(String message) {
    ReusableSnackBar.show(context, message);
  }
}
