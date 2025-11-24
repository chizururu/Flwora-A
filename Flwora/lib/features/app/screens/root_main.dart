import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flwora/features/app/screens/home/home.dart';
import 'package:flwora/features/app/screens/profile/profile.dart';
import 'package:get/get.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: controller.screens,
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: controller._onPageChanged,
            items: [
              // Nav bottom home
              BottomNavigationBarItem(
                icon: Icon(BootstrapIcons.house),
                activeIcon: Icon(BootstrapIcons.house_fill),
                label: 'Home',
              ),

              // Nav bottom profile
              BottomNavigationBarItem(
                icon: Icon(BootstrapIcons.person_badge),
                activeIcon: Icon(BootstrapIcons.person_badge_fill),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  // Variabel indeks halaman saat ini
  final Rx<int> currentIndex = 0.obs;

  // Method callback handler untuk mengganti halaman
  void _onPageChanged(int index) => currentIndex.value = index;

  // Halaman
  final screens = <Widget>[
    // Home screen
    const HomeScreen(),
    // Profile screen
    const ProfileScreen(),
  ];
}
