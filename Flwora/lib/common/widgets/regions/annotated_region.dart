import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TAnnotatedRegion extends StatelessWidget {
  final Widget child;

  const TAnnotatedRegion({super.key, required this.child});

  @override
  Widget build(BuildContext context) => AnnotatedRegion(
    value: const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
    child: child,
  );
}
