import 'package:flutter/material.dart';
import 'package:flwora/bindings/bindings.dart';
import 'package:flwora/features/app/screens/home/home.dart';
import 'package:flwora/features/authentication/screens/login.dart';
import 'package:flwora/utils/helpers/session_data_store.dart';
import 'package:flwora/utils/theme/theme.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBindings(),
      title: 'Flwora',
      theme: TAppTheme.data,
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Session manager
    final session = Get.find<SessionDataStore>();

    // Jika data session atau user sudah ada maka ke halaman home
    return Obx(
      () => session.isAuthenticated ? const HomeScreen() : const LoginScreen(),
    );
  }
}