import 'package:bhaladawala_app/custom_class/custom_appbar.dart';
import 'package:bhaladawala_app/custom_class/progessbar_with_appcolor.dart';
import 'package:bhaladawala_app/notification/notification_screen.dart';
import 'package:bhaladawala_app/repo/home_repo.dart';
import 'package:bhaladawala_app/screens/home_screens/carousel_container/carousel_container_slider.dart';
import 'package:bhaladawala_app/screens/home_screens/horizontal_explored_screen/horizontal_explored_screen.dart';
import 'package:bhaladawala_app/screens/home_screens/limited_period_deals/limited_period_deals.dart';
import 'package:bhaladawala_app/screens/home_screens/shop_by_category/shop_by_category.dart';
import 'package:bhaladawala_app/screens/home_screens/tabs/category_screen.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_fonts.dart';
import 'package:bhaladawala_app/utils/app_image_assets.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeRepo = HomeRepo();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
     await homeRepo.getHomeData();
    setState(() {
      isLoading = false;
    });
   /* if (responseMessage == AppStrings.success) {

    }else{
      var snack = SnackBar(
        content: Text(responseMessage.toString()),
        backgroundColor: Colors.red,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snack);
      }
      */


  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAppBar(
          appBarText: AppStrings.homeText,
          appBarImage: ImageAssets.bellIcon,
          appBarBackArrow: false,
          height: 30,
          onPressedCallback: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationScreen()));
          },
        ),
        body: isLoading
            ? const ProgressBarWithAppColor()
            : Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CarouselContainer(
                        listOfOffers: homeRepo.listOfOffers ?? [],
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppStrings.textShowCategory,
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.025,
                                  fontFamily: AppFonts.fontInterBold,
                                )),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                           const CategoryScreen()),
                                );
                              },
                              child: Text(AppStrings.textSeeAll,
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height *
                                        0.020,
                                    color: AppColors.appColor,
                                    fontFamily: AppFonts.fontInterMedium,
                                  )),
                            )
                          ],
                        ),
                      ),
                      GridViewCategory(list: homeRepo.listOfCategory ?? [],),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.002),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppStrings.textExploredThese,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: AppFonts.fontInterBold,
                                )),
                          ],
                        ),

                      ),
                       Container(

                           margin: const EdgeInsets.only(top: 20),
                           child: ExploredCarouselSlider(list :homeRepo.listOfExplore ?? [])),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppStrings.textPeriodDeals,
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.025,
                                  fontFamily: AppFonts.fontInterBold,
                                )),
                          ],
                        ),
                      ),
                      LimitedPeriodDeals(list: homeRepo.listOfLimitDeals ?? [],),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
