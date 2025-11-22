import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/scaffold/scaffold.dart';
import 'package:flwora/features/authentication/screens/register.dart';
import 'package:flwora/features/authentication/widgets/auth_redirect.dart';
import 'package:flwora/features/authentication/widgets/login_form_widget.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TScaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 10,
          children: [
            // Heading
            Text('Selamat Datang', style: TTextStyle.headingMedium),

            // Sub heading
            Text(
              'Masukkan email dan kata sandi Anda untuk memulai login. Tanaman sebagai sumber investasi masa depan',
              style: TTextStyle.body,
            ),

            const SizedBox(height: 15),

            const LoginFormWidget(),

            const SizedBox(height: 20),

            // Tombol navigasi ke halaman register
            AuthRedirect(
              message: 'Belum memiliki akun? ',
              actionLabel: 'Register',
              onNav: () => Get.to(const RegisterScreen()),
            ),
          ],
        ),
      ),
    );
  }
}
