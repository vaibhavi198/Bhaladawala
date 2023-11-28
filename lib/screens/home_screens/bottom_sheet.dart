import 'package:bhaladawala_app/screens/home_screens/tabs/category_screen.dart';
import 'package:bhaladawala_app/screens/home_screens/tabs/home_screen.dart';
import 'package:bhaladawala_app/screens/my_cart/cart.dart';
import 'package:bhaladawala_app/screens/my_orders/my_orders.dart';
import 'package:bhaladawala_app/screens/my_profile/profile_screen.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_image_assets.dart';
import 'package:flutter/material.dart';



class BottomSheetScreen extends StatefulWidget {
  const BottomSheetScreen({super.key});

  @override
  BottomSheetScreenState createState() => BottomSheetScreenState();
}

class BottomSheetScreenState extends State<BottomSheetScreen> {
  int _selectedIndex = 0; // Index of the selected tab

  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const CategoryScreen(),
    const  CartScreen(),
    const MyOrderScreen(),
    const ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.bottomSheetBackGroundColor,
        type: BottomNavigationBarType.fixed,
        elevation: 0.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: CustomSelectedContainer(
                selectedIndex: _selectedIndex,
                compareIndex: 0,
                imageName: _selectedIndex == 0 ? ImageAssets.homeFillIconNavBar : ImageAssets.homeIconNavBar ,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: CustomSelectedContainer(
                selectedIndex: _selectedIndex,
                compareIndex: 1,
                imageName:_selectedIndex == 1 ? ImageAssets.moreFillIconNavBar : ImageAssets.moreIconNavBar,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: bottomContainer(
                ImageAssets.cartIconNavBar,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: CustomSelectedContainer(
                selectedIndex: _selectedIndex,
                compareIndex: 3,
                imageName: ImageAssets.orderBagIconNavBar,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: CustomSelectedContainer(
                selectedIndex: _selectedIndex,
                compareIndex: 4,
                imageName: _selectedIndex == 4 ?ImageAssets.profileFillIconNavBar : ImageAssets.profileIconNavBar,
              ),
              label: ''),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.appColor,
        unselectedItemColor: AppColors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget bottomContainer(String imageName) {
    return Container(
      height: 50,
      width: 70,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.appColor, // Background color
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ImageIcon(
          color: AppColors.white,
          AssetImage(imageName),
        ),
      ),
    );
  }

  Widget selectedContainer(String imageName, bool selectedOption) {
    return Container(
      height: 50,
      width: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selectedOption == true
            ? AppColors.white
            : AppColors.blueGrey.withOpacity(0.01), // Background color
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ImageIcon(
          color: AppColors.grey,
          AssetImage(imageName),
        ),
      ),
    );
  }
}

class CustomSelectedContainer extends StatelessWidget {
  const CustomSelectedContainer({
    super.key,
    required int selectedIndex,
    required this.compareIndex,
    required this.imageName,
  }) : _selectedIndex = selectedIndex;

  final int _selectedIndex;
  final int compareIndex;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _selectedIndex == compareIndex
            ? AppColors.black.withOpacity(0.05)
            : AppColors.white, // Background color
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ImageIcon(
          AssetImage(imageName),
        ),
      ),
    );
  }
}
