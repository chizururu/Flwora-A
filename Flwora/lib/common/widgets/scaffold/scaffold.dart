import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/refresher/t_refresh_indicator.dart';
import 'package:flwora/common/widgets/regions/t_annotated_region.dart';
import 'package:flwora/utils/device/ui_utils.dart';

class TScaffold extends StatelessWidget {
  final PreferredSizeWidget? header;
  final Widget content;
  final AsyncCallback? handleRefresh;

  const TScaffold({
    super.key,
    this.header,
    required this.content,
    this.handleRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final keyboardInsets = UiUtils.viewInsets();

    final slivers = <Widget>[
      const HeaderLocator.sliver(clearExtent: false),

      if (header != null) header!,

      if (keyboardInsets.bottom > 0)
        SliverPadding(padding: EdgeInsets.only(bottom: keyboardInsets.bottom)),
    ];

    return TAnnotatedRegion(
      child: Scaffold(
        body: EasyRefresh.builder(
          header: TRefreshHeader(),
          onRefresh: null,
          notLoadFooter: const NotLoadFooter(maxOverOffset: 0),
          childBuilder: (context, physics) =>
              CustomScrollView(physics: physics, slivers: slivers),
        ),
      ),
    );
  }
}
