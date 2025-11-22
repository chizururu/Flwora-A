import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/appbar/appbar.dart';
import 'package:flwora/common/widgets/scaffold/scaffold.dart';
import 'package:flwora/features/authentication/screens/login.dart';
import 'package:flwora/features/authentication/widgets/auth_redirect.dart';
import 'package:flwora/features/authentication/widgets/register_form_widget.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TScaffold(
      appbar: TAppbar(title: 'Register'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 10,
        children: [
          // Heading
          Text('Daftar Akun', style: TTextStyle.headingMedium),

          // Sub heading
          Text(
            'Masukkan nama, email, kata sandi, dan konfirmasi kata sandi Anda untuk membuat akun',
            style: TTextStyle.body,
          ),

          const SizedBox(height: 20),

          const RegisterFormWidget(),

          const SizedBox(height: 20),
          // Tombol navigasi ke halaman login
          AuthRedirect(
            message: 'Sudah memiliki akun? ',
            actionLabel: 'Login',
            onNav: () => Get.to(const LoginScreen()),
          ),
        ],
      ),
    );
  }
}
