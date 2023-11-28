import 'package:bhaladawala_app/custom_class/custom_appbar.dart';
import 'package:bhaladawala_app/custom_class/custom_container.dart';
import 'package:bhaladawala_app/custom_class/custom_divider.dart';
import 'package:bhaladawala_app/custom_class/custom_elevated_button.dart';
import 'package:bhaladawala_app/custom_class/custom_style.dart';
import 'package:bhaladawala_app/custom_class/progessbar_with_appcolor.dart';
import 'package:bhaladawala_app/custom_class/snack_bar.dart';
import 'package:bhaladawala_app/custom_class/custom_class_switch.dart';
import 'package:bhaladawala_app/model/profile_model.dart';
import 'package:bhaladawala_app/repo/profile_repo.dart';
import 'package:bhaladawala_app/screens/auth_screens/reset_password.dart';
import 'package:bhaladawala_app/screens/auth_screens/sigin_screen.dart';
import 'package:bhaladawala_app/screens/my_profile/edit_profile_screen.dart';
import 'package:bhaladawala_app/screens/my_profile/stores_list.dart';
import 'package:bhaladawala_app/shared_preference/shared_preference_manager.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_fonts.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:url_launcher/url_launcher.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileScreenButtonController = RoundedLoadingButtonController();
  final repo = ProfileRepo();
  bool isLoading = false;
  final ProfileRepo profileRepo = ProfileRepo();


  @override
  void initState() {
    super.initState();

    getProfileData();
  }

  Future<void> getProfileData() async {

    setState(() {
      isLoading = true;
    });

    await repo.getProfileData();

    setState(() {
      isLoading = false;
    });
  }

  bool status = true;

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();
  var phoneNumber = "7874823263";
  var message = "Hello";


  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          appBarText: 'My Profile',
          appBarBackArrow: false,

        ),
        body: isLoading ? const Center(child:  ProgressBarWithAppColor()) :
        Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.height * 0.7,
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
              child: ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.grey,
                  size: 50.0,
                ),
                title: Text(
                  "${repo.profileData?.firstName ?? ''} ${repo.profileData?.lastName ?? ''}",
                  style: const TextStyle(fontFamily: AppFonts.fontInterBold),
                ),
                subtitle:  Text(repo.profileData?.phoneNumber ?? ''),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditProfileScreen(profileData: repo.profileData ?? ProfileData())),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.023,
                  left: MediaQuery.of(context).size.height * 0.38),
              child: GestureDetector(
                onTap: () {},
                child: const Text(
                  "Edit",
                  style: TextStyle(
                    color: AppColors.appColor,
                    fontSize: 15,
                    fontFamily: AppFonts.fontInterMedium,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(8.0),
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.13),
              child: Column(
                children: [
                  Container(
                    decoration: CustomStyle.decorationWithBGColor,
                    child:  Column(
                      children: [
                         Row(
                          children: [
                            const CustomContainer(
                              isShowForwardArrow: false,
                              text: "Notification",
                              text2: '',
                              containerTextColor: Colors.black,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.45,
                            ),
                            CustomSwitch(
                              value: status,
                              onChanged: (value) {
                                //print("VALUE : $value");
                                setState(() {
                                  status = value;
                                });
                              },
                            ),
                          //  const ToggleSwitch()
                          ],
                        ),
                        const CustomDivider(),
                        GestureDetector(
                          onTap: ()  {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const StoreListsScreen(),));
                          },
                          child: CustomContainer(

                            text: "Location",
                            text2: repo.profileData?.storeList?[0].storeAddress ?? '',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      decoration: CustomStyle.decorationWithBGColor,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02),
                      child: GestureDetector(
                        onTap: (){
                          final Uri whatsApp = Uri.parse('https://wa.me/$phoneNumber/?text=${Uri.encodeComponent(message)}');
                          launchUrl(whatsApp);
                        },
                        child: const CustomContainer(
                          text: "Contact us",
                          isShowArrow: true,
                          text2: '',
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    decoration: CustomStyle.decorationWithBGColor,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: ()  {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ResetPassword(),));
                          },
                          child: const CustomContainer(
                            text: "Change Password",
                            text2: '',
                          ),
                        ),
                        const CustomDivider(),
                      /*  InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CustomAlertDialog(
                                    title: AppStrings.textConfirmAccountDeletion,
                                    actions: <Widget>[
                                      CustomElevatedButton(
                                        text: AppStrings.textNoCancel,
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ProfileScreen()));
                                        },
                                        buttonColor: AppColors.white,
                                        colorText: AppColors.black,
                                        controller: null,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      CustomElevatedButton(
                                        text: AppStrings.textYesConfirm,
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        buttonColor: AppColors.appColor,
                                        colorText: AppColors.white,
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: InkWell(
                              onTap: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                final message = await repo.deleteAccount();
                                setState(() {
                                  isLoading = false;
                                });

                                print("Message::$message");
                                if (message == "1") {
                                  successSnackBar('User delete successfully.');
                                } else if (message == "10"){
                                  errorSnackBar('User Not found');
                                }
                                else {
                                  errorSnackBar("Something went wrong..please try again later.");
                                }
                              },
                              child: const CustomContainer(
                                text: AppStrings.textDeleteAccount,
                                text2: '',
                              ),
                            )),*/
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomAlertDialog(
                                  title: AppStrings.textConfirmAccountDeletion,
                                  actions: <Widget>[
                                    SizedBox(
                                      height:MediaQuery.of(context).size.height * 0.05,
                                      width: MediaQuery.of(context).size.width,
                                      child: ElevatedButton(
                                          onPressed: (){
                                            Navigator.pop(context);
                                          },
                                          style: ButtonStyle(
                                            shape:  MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                                              ),
                                            ),
                                            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                                  (Set<MaterialState>states) {
                                                if (states.contains(MaterialState.pressed)) {
                                                  return Colors.transparent;
                                                }
                                                return AppColors
                                                    .appColor;
                                              },
                                            ),
                                          ),
                                          child: const Text(
                                            AppStrings.textNoCancel,
                                            style: TextStyle(
                                              color: AppColors.black,
                                              fontSize: 18,
                                              fontFamily: AppFonts.fontInterMedium,
                                            ),
                                          )

                                      ),
                                    )
                                 ,
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    CustomElevatedButton(
                                      text:  AppStrings.textYesConfirm,
                                      onPressed: () async {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        final message = repo.deleteAccount();
                                        setState(() {
                                          isLoading = false;
                                        });

                                        print(" Delete Message::$message");
                                        Navigator.pop(context);
                                        if (message == "1") {
                                          await SharedPrefManager.shared.clearSession();
                                          successSnackBar('User delete successfully.');
                                          navigationToSignInScreen();
                                        }
                                        else if (message == "10"){
                                          errorSnackBar('User Not found');
                                        }
                                        else {
                                          errorSnackBar("Something went wrong..please try again later.");
                                        }
                                      },
                                      buttonColor: AppColors.appColor,
                                      colorText: AppColors.white,
                                      controller: profileScreenButtonController,
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const CustomContainer(
                            text: AppStrings.textDeleteAccount,
                            isShowForwardArrow: false,
                            text2: '',
                          ),
                        ),
                        const CustomDivider(),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomAlertDialog(
                                  title: AppStrings.textAreYouSureLogout,
                                  actions: <Widget>[
                                    SizedBox(
                                      height:MediaQuery.of(context).size.height * 0.05,
                                      width: MediaQuery.of(context).size.width,
                                      child: ElevatedButton(
                                          onPressed: (){
                                        Navigator.pop(context);
                                      },
                                          style: ButtonStyle(
                                            shape:  MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                                              ),
                                            ),
                                            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                                    (Set<MaterialState>states) {
                                                      if (states.contains(MaterialState.pressed)) {
                                                        return Colors.transparent;
                                                      }
                                                      return AppColors
                                                          .appColor;
                                                    },
                                                  ),
                                          ),
                                          child: const Text(
                                        AppStrings.textNoCancel,
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 18,
                                          fontFamily: AppFonts.fontInterMedium,
                                        ),
                                      )

                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    CustomElevatedButton(
                                      text:  AppStrings.textYesConfirm,
                                      onPressed: () async {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        final message = await repo.logOut();

                                        setState(() {
                                          isLoading = false;
                                        });

                                        print("Message::$message");
                                        Navigator.pop(context);
                                        if (message == "1") {
                                          await SharedPrefManager.shared.clearSession();
                                          successSnackBar('successfully Logout');
                                          navigationToSignInScreen();
                                        }
                                      else {
                                          errorSnackBar('User Not found');
                                        }
                                      },
                                      buttonColor: AppColors.appColor,
                                      colorText: AppColors.white,
                                      controller: profileScreenButtonController,
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const CustomContainer(
                            text: AppStrings.textLogout,
                            isShowForwardArrow: false,
                            text2: '',
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
        backgroundColor: Colors.grey.shade300,
      ),
    );
  }


  void navigationToSignInScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
    );
  }

  void errorSnackBar(String message) {
    ReusableSnackBar.show(context, message);
  }

  void successSnackBar(String message) {
    ReusableSnackBar.show(context,message, isSuccess: true);
  }

}

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final List<Widget> actions;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Set the border radius
      ),
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.black,
          fontSize: MediaQuery.of(context).size.height * 0.022,
          fontFamily: AppFonts.fontInterBold,
        ),
      ),
      actions: actions,
    );
  }



}
