import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:italian_food/views/settings/view/settings_screen.dart';

import 'consts/app_colors.dart';
import 'indridients/views/ingredients_screen.dart';
import 'menu/views/menu_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> homeWidgets = [
    const MenuScreen(),
    const IngredientsScreen(),
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeWidgets[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/cutlery.svg',
              width: 20.0,
              height: 20.0,
              color: currentIndex == 0
                  ? AppColors.darkOrangeColor
                  : AppColors.lightGreyColor,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/fire.svg',
              width: 20.0,
              height: 20.0,
              color: currentIndex == 1
                  ? AppColors.darkOrangeColor
                  : AppColors.lightGreyColor,
            ),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/settings.svg',
                width: 20.0,
                height: 20.0,
                color: currentIndex == 2
                    ? AppColors.darkOrangeColor
                    : AppColors.lightGreyColor,
              ),
              label: 'News'),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        // backgroundColor: AppColors.blueColor,
        // unselectedItemColor: AppColors.lightGreyColor,
        // selectedItemColor: AppColors.lightBlueColor,
        showUnselectedLabels: false,
        showSelectedLabels: false,
      ),
    );
  }
}
