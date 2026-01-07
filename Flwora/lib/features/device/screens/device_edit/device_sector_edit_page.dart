import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/appbar/appbar.dart';
import 'package:flwora/common/widgets/scaffold/scaffold.dart';

class DeviceSectorEditPage extends StatelessWidget {
  const DeviceSectorEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TScaffold(
      header: TAppBar(title: 'Pindah Sektor'),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [],
      ),
    );
  }
}
