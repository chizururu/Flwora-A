import 'package:flutter/material.dart';
import 'package:flwora/bindings/general_bindings.dart';
import 'package:flwora/features/device/screens/device_edit/wifi_edit_page.dart';
import 'package:flwora/features/device/screens/device_setup/device_name_page.dart';
import 'package:flwora/features/device/screens/device_setup/pair_device_page.dart';
import 'package:flwora/features/device/screens/device_setup/wifi_setup_page.dart';
import 'package:flwora/features/home/screens/home_screen.dart';
import 'package:flwora/utils/theme/theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GeneralBindings(),
      theme: AppTheme.data,
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
