import 'package:flutter/material.dart';
import 'package:flwora/bindings/general_bindings.dart';
import 'package:flwora/utils/theme/theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GeneralBindings(),
      theme: AppTheme.data,
      home: const Placeholder(),
      debugShowCheckedModeBanner: false,
    );
  }
}
