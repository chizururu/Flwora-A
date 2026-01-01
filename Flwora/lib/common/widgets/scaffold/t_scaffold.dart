import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/regions/t_annotated_region.dart';

class TScaffold extends StatelessWidget {
  const TScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return TAnnotatedRegion(child: Scaffold(body: const Placeholder()));
  }
}
