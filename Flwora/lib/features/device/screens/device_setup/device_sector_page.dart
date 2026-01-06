import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/appbar/appbar.dart';
import 'package:flwora/common/widgets/scaffold/scaffold.dart';

class DeviceSectorPage extends StatelessWidget {
  const DeviceSectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TScaffold(
      header: TAppBar(title: 'Atur Tempat Perangkat', showBackButton: true),
      content: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [],
        ),
      ),
    );
  }
}
