import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/appbar/appbar.dart';
import 'package:flwora/common/widgets/forms/text_field.dart';
import 'package:flwora/common/widgets/scaffold/scaffold.dart';

class DeviceNamePage extends StatelessWidget {
  const DeviceNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return TScaffold(
      header: TAppBar(title: 'Profile Perangkat', showBackButton: true),
      content: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TTextFormField(
              controller: TextEditingController(),
              labelText: 'Nama Perangkat',
            ),
          ],
        ),
      ),
    );
  }
}
