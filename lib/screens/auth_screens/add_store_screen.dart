import 'package:bhaladawala_app/custom_class/custom_Textfield_class.dart';
import 'package:bhaladawala_app/custom_class/custom_elevated_button.dart';
import 'package:bhaladawala_app/custom_class/snack_bar.dart';
import 'package:bhaladawala_app/repo/add_store_repo.dart';
import 'package:bhaladawala_app/screens/home_screens/bottom_sheet.dart';
import 'package:bhaladawala_app/screens/home_screens/home_bottom_nav_bar.dart';
import 'package:bhaladawala_app/shared_preference/shared_preference_manager.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_fonts.dart';
import 'package:bhaladawala_app/utils/app_image_assets.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class AddStoreScreen extends StatefulWidget {
  const AddStoreScreen({super.key});

  @override
  State<AddStoreScreen> createState() => _AddStoreScreenState();
}

class _AddStoreScreenState extends State<AddStoreScreen> {
  final addStoreButtonController = RoundedLoadingButtonController();
  final TextEditingController _addStoreController = TextEditingController();
  final TextEditingController _storeAddressController = TextEditingController();
  final addStoreRepo = AddStoreRepo();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
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
                      icon:
                          const Icon(Icons.arrow_back, color: AppColors.black),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.20),
                            child: Image.asset(
                              ImageAssets.addStoreImage,
                              height: MediaQuery.of(context).size.height * 0.2,
                            )),
                        Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.15,
                                left: MediaQuery.of(context).size.width * 0.03),
                            child: const Text(AppStrings.textAddStore,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: AppFonts.fontInterBold,
                                    fontWeight: FontWeight.bold))),
                        Container(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              CustomTextField(
                                controller: _addStoreController,
                                hintText2: AppStrings.textHintText2StoreName,
                                hintText: AppStrings.textHintTextStoreName,
                              ),
                              CustomTextField(
                                controller: _storeAddressController,
                                hintText2: AppStrings.textHintText2StoreAddress,
                                hintText: AppStrings.textHintTextStoreAddress,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width,
                                child: CustomElevatedButton(
                                  text: AppStrings.textBtnContinue,
                                  onPressed: () async {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    String addStore = _addStoreController.text;
                                    String storeAddress = _storeAddressController.text;
                                    if (addStore.isEmpty) {
                                      errorSnackBar('Enter add store name');
                                    } else if (storeAddress.isEmpty) {
                                      errorSnackBar('Enter store address');
                                    } else {
                                      final message = await addStoreRepo.addStore(addStore, storeAddress);

                                      if (message == '1') {
                                        SharedPrefManager.shared.sharedPres.setBool(AppStrings.isAlreadyStoreAdded, true);
                                        navigationToHomeScreen();
                                      } else {
                                        errorSnackBar(message);
                                      }
                                    }
                                  },
                                  buttonColor: AppColors.appColor,
                                  colorText: AppColors.white,
                                  controller: addStoreButtonController,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void errorSnackBar(String message) {
    ReusableSnackBar.show(context, message);
  }

  void navigationToHomeScreen() {
    ReusableSnackBar.show(context, AppStrings.yourStoreHasBeenAddedSuccessfully,
        isSuccess: true);
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const BottomSheetScreen()));
  }
}
