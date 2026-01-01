import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

class TRefreshHeader extends BuilderHeader {
  TRefreshHeader({
    super.triggerOffset = 100.0,
    super.clamping = false,
    super.position = IndicatorPosition.locator,
  }) : super(builder: (context, state) => TRefreshIndicator());
}

class TRefreshIndicator extends StatelessWidget {
  const TRefreshIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
