import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/appbar/appbar.dart';
import 'package:flwora/common/widgets/scaffold/scaffold.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TScaffold(
      appbar: TAppbar(title: 'Profile'),
      body: Column(children: []),
    );
  }
}
