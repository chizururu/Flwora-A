import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/appbar/appbar.dart';
import 'package:flwora/common/widgets/scaffold/scaffold.dart';
import 'package:flwora/data/models/device.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';

class DeviceDetailScreen extends StatelessWidget {
  final Device device;

  const DeviceDetailScreen({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return TScaffold(
      appbar: TAppbar(
        hasBackButton: true,
        title: device.name,
        actions: [],
        pinned: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text('Dashboard', style: TTextStyle.headingSmall)],
          ),
        ],
      ),
    );
  }
}
