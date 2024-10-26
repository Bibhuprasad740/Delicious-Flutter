import 'package:flutter/material.dart';

import '../../global/constants.dart';
import '../../widgets/tab_button.dart';
import '../home/home_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  var currentTab = 2;
  var pageStorageBucket = PageStorageBucket();

  Widget currentScreen = HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: pageStorageBucket, child: currentScreen),
      floatingActionButton: SizedBox(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          backgroundColor:
              currentTab == 2 ? AppColors.primary : AppColors.placeholder,
          shape: const CircleBorder(),
          onPressed: () {
            if (currentTab != 2) {
              currentTab = 2;
              currentScreen = HomeScreen();
            }
            if (mounted) {
              setState(() {});
            }
          },
          child: Image.asset(
            'assets/images/tab_home.png',
            width: 30,
            height: 30,
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.white,
        shadowColor: Colors.black12,
        surfaceTintColor: Colors.white,
        notchMargin: AppSizes.smallMargin,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TabButton(
              imageUrl: 'assets/images/tab_menu.png',
              title: 'Menu',
              isSelected: currentTab == 0,
              onTap: () {
                if (currentTab != 0) {
                  currentTab = 0;
                  // TODO: Add Menu screen
                  currentScreen = Container();
                }
                if (mounted) {
                  setState(() {});
                }
              },
            ),
            TabButton(
              imageUrl: 'assets/images/tab_offer.png',
              title: 'Offers',
              isSelected: currentTab == 1,
              onTap: () {
                if (currentTab != 1) {
                  currentTab = 1;
                  // TODO: Add Offers screen
                  currentScreen = Container();
                }
                if (mounted) {
                  setState(() {});
                }
              },
            ),
            const SizedBox(width: 40),
            TabButton(
              imageUrl: 'assets/images/tab_profile.png',
              title: 'Profile',
              isSelected: currentTab == 3,
              onTap: () {
                if (currentTab != 3) {
                  currentTab = 3;
                  // TODO: Add Profile screen
                  currentScreen = Container();
                }
                if (mounted) {
                  setState(() {});
                }
              },
            ),
            TabButton(
              imageUrl: 'assets/images/tab_more.png',
              title: 'More',
              isSelected: currentTab == 4,
              onTap: () {
                if (currentTab != 4) {
                  currentTab = 4;
                  // TODO: Add More screen
                  currentScreen = Container();
                }
                if (mounted) {
                  setState(() {});
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
