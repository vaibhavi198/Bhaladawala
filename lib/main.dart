import 'package:bhaladawala_app/model/profile_model.dart';
import 'package:bhaladawala_app/notification/no_internet.dart';
import 'package:bhaladawala_app/notification/notification_screen.dart';
import 'package:bhaladawala_app/order_accepted_screen.dart';
import 'package:bhaladawala_app/order_failed.dart';
import 'package:bhaladawala_app/screens/home_screens/home_bottom_nav_bar.dart';
import 'package:bhaladawala_app/screens/home_screens/horizontal_explored_screen/horizontal_explored_screen.dart';
import 'package:bhaladawala_app/screens/home_screens/limited_period_deals/limited_period_deals.dart';
import 'package:bhaladawala_app/screens/home_screens/shop_by_category/shop_by_category.dart';
import 'package:bhaladawala_app/screens/home_screens/tabs/category_screen.dart';
import 'package:bhaladawala_app/screens/my_cart/cart.dart';
import 'package:bhaladawala_app/screens/my_orders/my_orders.dart';
import 'package:bhaladawala_app/screens/auth_screens/add_store_screen.dart';
import 'package:bhaladawala_app/screens/auth_screens/otp_screen.dart';
import 'package:bhaladawala_app/screens/auth_screens/reset_password.dart';
import 'package:bhaladawala_app/screens/auth_screens/forgot_password_screen.dart';
import 'package:bhaladawala_app/screens/auth_screens/sigin_screen.dart';
import 'package:bhaladawala_app/screens/auth_screens/signup_screen.dart';
import 'package:bhaladawala_app/screens/home_screens/tabs/home_screen.dart';
import 'package:bhaladawala_app/screens/my_cart/my_cart.dart';
import 'package:bhaladawala_app/screens/my_profile/edit_profile_screen.dart';
import 'package:bhaladawala_app/screens/my_profile/profile_screen.dart';
import 'package:bhaladawala_app/screens/my_profile/stores_list.dart';
import 'package:bhaladawala_app/screens/product_list/custom_product_list.dart';
import 'package:bhaladawala_app/screens/product_list/product_detail.dart';
import 'package:bhaladawala_app/screens/product_list/product_list.dart';
import 'package:bhaladawala_app/screens/splash_screen/intro_screen.dart';
import 'package:bhaladawala_app/screens/splash_screen/splash_screen.dart';
import 'package:bhaladawala_app/shared_preference/shared_preference_manager.dart';
import 'package:bhaladawala_app/utils/app_routes_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefManager.shared.initialize();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        routes: {
          AppRoutesString.splashScreenRoute: (context) => const SplashScreen(),
          AppRoutesString.introScreenRoute: (context) => const IntroScreen(),
          AppRoutesString.signInScreenRoutes: (context) => const SignInScreen(),
          AppRoutesString.signUpScreenRoutes: (context) => const SignUpScreen(),
          AppRoutesString.resetPinScreenRoutes: (context) => const ResetPinScreen(),
          AppRoutesString.otpScreenRoutes: (context) => const OtpScreen(),
          AppRoutesString.resetPasswordScreenRoutes: (context) => const ResetPassword(),
          AppRoutesString.addStoreScreenRoutes: (context) => const AddStoreScreen(),
          AppRoutesString.homeBottomNavBarScreenRoutes: (context) => const HomeBottomNavigationBar(),
          AppRoutesString.homeScreenScreenRoutes: (context) => const HomeScreen(),
          AppRoutesString.categoryScreenScreenRoutes: (context) =>  const CategoryScreen(),
          AppRoutesString.cartScreenScreenRoutes: (context) =>  const CartScreen(),
          AppRoutesString.myOrderScreenScreenRoutes: (context) => const MyOrderScreen(),
          AppRoutesString.profileScreenRoutes: (context) => const ProfileScreen(),
          AppRoutesString.productListScreenRoutes: (context) =>  const ProductListScreen(id: '',),
          AppRoutesString.gridViewCategoryScreenRoutes: (context) =>  GridViewCategory(list: const [],),
          AppRoutesString.limitedPeriodDealsScreenRoutes: (context) => LimitedPeriodDeals(list: const [],),
          AppRoutesString.exploredCarousalScreenRoutes: (context) =>  ExploredCarouselSlider(list: const [],),
          AppRoutesString.myEmptyCartScreenRoutes: (context) => const MyCartEmptyScreen(),
          //AppRoutesString.noOrderPlacedScreenRoutes: (context) => const NoOrderPlacedScreen(),
          AppRoutesString.editProfileScreenRoutes: (context) =>  EditProfileScreen(profileData: ProfileData(),),
          AppRoutesString.customProductsScreenRoutes: (context) =>  const CustomProductList(productList: [],),
          AppRoutesString.productDetailsScreenRoutes: (context) =>  const ProductDetailScreen(id: '',),
          AppRoutesString.noInternetScreenRoutes: (context) => const NoInternetScreen(),
          AppRoutesString.noNotificationScreenRoutes: (context) => const NotificationScreen(),
          AppRoutesString.orderFailedScreenRoutes: (context) => const OrderFailedScreen(),
          AppRoutesString.orderAcceptedScreenRoutes: (context) => const OrderAcceptedScreen(),
          AppRoutesString.storeListsScreenRoutes: (context) => const StoreListsScreen(),

        }
    );
  }
}


