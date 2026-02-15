import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flwora/features/home/screens/home_screen.dart';
import 'package:flwora/features/profile/screens/profile_screen.dart';

class Destination {
  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final Widget page;

  const Destination({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.page,
  });
}

const List<Destination> destinations = [
  Destination(
    label: "Home",
    icon: BootstrapIcons.house,
    selectedIcon: BootstrapIcons.house_fill,
    page: HomeScreen(),
  ),
  Destination(
    label: "Profile",
    icon: BootstrapIcons.person_badge,
    selectedIcon: BootstrapIcons.person_badge_fill,
    page: ProfileScreen(),
  ),
];
