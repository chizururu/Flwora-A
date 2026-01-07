import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/appbar/appbar.dart';
import 'package:flwora/common/widgets/forms/text_field.dart';
import 'package:flwora/common/widgets/scaffold/scaffold.dart';
import 'package:flwora/utils/constants/colors.dart';
import 'package:flwora/utils/constants/sizes.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';

class WiFiEditPage extends StatelessWidget {
  const WiFiEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TScaffold(
      header: TAppBar(title: 'Ganti Jaringan Wi-Fi'),
      content: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Sub heading
            Text(
              "Hubungkan perangkat ke Jaringan Wi-Fi baru",
              style: TTextTheme.body.copyWith(color: TColors.textSecondary),
            ),
            const SizedBox(height: Sizes.xl),

            TTextFormField(
              controller: TextEditingController(),
              labelText: 'SSID',
            ),

            const SizedBox(height: Sizes.xl),

            TTextFormField.password(
              controller: TextEditingController(),
              labelText: 'Kata Sandi',
            ),
          ],
        ),
      ),
    );
  }
}
