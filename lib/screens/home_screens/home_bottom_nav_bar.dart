import 'package:bhaladawala_app/model/product_list.dart';
import 'package:bhaladawala_app/screens/home_screens/tabs/category_screen.dart';
import 'package:bhaladawala_app/screens/home_screens/tabs/home_screen.dart';
import 'package:bhaladawala_app/screens/my_cart/cart.dart';
import 'package:bhaladawala_app/screens/my_orders/my_orders.dart';
import 'package:bhaladawala_app/screens/my_profile/profile_screen.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_image_assets.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeBottomNavigationBar extends StatefulWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  State<HomeBottomNavigationBar> createState() =>
      _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {
  int pageIndex = 0;
  List<GlobalKey<_HomeBottomNavigationBarState>> tabKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  PersistentTabController controller = PersistentTabController();

  List<Widget> _buildScreens() {
    return [
      HomeScreen(key: tabKeys[0]),
      CategoryScreen(key: tabKeys[1]),
      CartScreen(key: tabKeys[2]),
      MyOrderScreen(key: tabKeys[3]),
      ProfileScreen(key: tabKeys[4])
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const ImageIcon(
          AssetImage(ImageAssets.homeIconNavBar),
        ),
        activeColorPrimary: AppColors.appColor,
        inactiveColorPrimary: Colors.blueGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const ImageIcon(
          AssetImage(ImageAssets.moreIconNavBar),
        ),
        activeColorPrimary: AppColors.appColor,
        inactiveColorPrimary: Colors.blueGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Container(
          margin: const EdgeInsets.only(top: 5),
          child: const ImageIcon(
            color: Colors.white,
            AssetImage(
              ImageAssets.cartIconNavBar,
            ),
          ),
        ),
        activeColorPrimary: AppColors.appColor,
        inactiveColorPrimary: Colors.blueGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const ImageIcon(
          AssetImage(ImageAssets.orderBagIconNavBar),
        ),
        activeColorPrimary: AppColors.appColor,
        inactiveColorPrimary: Colors.blueGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const ImageIcon(
          AssetImage(ImageAssets.profileIconNavBar),
        ),
        activeColorPrimary: AppColors.appColor,
        inactiveColorPrimary: Colors.blueGrey,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    controller = PersistentTabController(initialIndex: 0);
  }
  void _onTabSelected(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      onItemSelected: _onTabSelected,
      confineInSafeArea: true,
      hideNavigationBarWhenKeyboardShows: true,
      stateManagement: true,
      navBarStyle: NavBarStyle.style15,
      hideNavigationBar: false,
      decoration: NavBarDecoration(borderRadius: BorderRadius.circular(1)),
    );
  }
}
