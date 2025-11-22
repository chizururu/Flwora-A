import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/appbar/appbar.dart';
import 'package:flwora/common/widgets/scaffold/scaffold.dart';

class AddSectorScreen extends StatelessWidget {
  const AddSectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TScaffold(
      appbar: TAppbar(
        hasBackButton: true,
        title: 'Tambah Sektor',
        actionIcon: Icons.check,
        onActionPressed: () => (),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 20,
        children: [],
      ),
    );
  }
}
