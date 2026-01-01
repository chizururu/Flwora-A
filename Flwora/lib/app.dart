import 'package:flutter/material.dart';
import 'package:flwora/features/home/screens/home.dart';
import 'package:flwora/utils/theme/theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.data,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

