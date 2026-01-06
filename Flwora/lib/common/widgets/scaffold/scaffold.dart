import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/regions/annotated_region.dart';
import 'package:flwora/common/widgets/scaffold/content_sliver.dart';
import 'package:flwora/utils/device/ui_utils.dart';

class TScaffold extends StatelessWidget {
  final Widget content;
  final Widget? header;

  const TScaffold({super.key, required this.content, this.header});

  @override
  Widget build(BuildContext context) {
    final keyboardInsets = UiUtils.viewInsets(context);

    final slivers = <Widget>[
      if (header != null) header!,

      ContentSliver(content: content),

      if (keyboardInsets.bottom > 0)
        SliverPadding(padding: EdgeInsets.only(bottom: keyboardInsets.bottom)),
    ];

    final mainContent = CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: slivers,
    );

    return TAnnotatedRegion(
      child: Scaffold(body: SafeArea(child: mainContent)),
    );
  }
}
