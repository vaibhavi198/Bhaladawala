import 'package:bhaladawala_app/custom_class/custom_Textfield_class.dart';
import 'package:bhaladawala_app/custom_class/custom_appbar.dart';
import 'package:bhaladawala_app/custom_class/custom_elevated_button.dart';
import 'package:bhaladawala_app/custom_class/snack_bar.dart';
import 'package:bhaladawala_app/model/profile_model.dart';
import 'package:bhaladawala_app/repo/profile_repo.dart';
import 'package:bhaladawala_app/screens/my_profile/profile_screen.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class EditProfileScreen extends StatefulWidget {
  ProfileData profileData;

  EditProfileScreen({super.key, required this.profileData});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final editProfileController = RoundedLoadingButtonController();

  final repo = ProfileRepo();

  @override
  void initState() {
    super.initState();
    firstNameController.text = widget.profileData.firstName ?? '';
    lastNameController.text = widget.profileData.lastName ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          appBarText: AppStrings.textEditProfile,
          appBarBackArrow: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(
                  controller: firstNameController,
                  hintText2: AppStrings.firstName,
                  hintText: AppStrings.enterFirstName),
              CustomTextField(
                  controller: lastNameController,
                  hintText2: AppStrings.lastName,
                  hintText: AppStrings.enterLastName),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width,
                child: CustomElevatedButton(
                  text: AppStrings.textSaveChanges,
                  onPressed: () async {
                   final message = await repo.editProfileData(
                      firstNameController.text,
                      lastNameController.text,
                      repo.profileData?.email ?? '',
                      repo.profileData?.countryCode ?? '',
                      repo.profileData?.phoneNumber ?? '',
                    );
                   if(message == "1"){
                     successSnackBar('You profile update successfully');
                     navigation();
                   }else{
                     errorSnackBar(message);
                   }
                  },
                  buttonColor: AppColors.appColor,
                  colorText: AppColors.white,
                  controller: editProfileController,
                ),
              ),
            ],
          ),
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
        context,
        MaterialPageRoute(
            builder: (context) =>
            const ProfileScreen()));
  }
}
