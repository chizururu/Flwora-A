import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:flwora/common/widgets/banner/no_connection_banner.dart';
// import 'package:flwora/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class TScaffold extends StatelessWidget {
  final Widget? appbar;
  final Widget body;
  final Future<void> Function()? onRefresh;
  final bool ignoreOffline;

  const TScaffold({
    super.key,
    this.appbar,
    required this.body,
    this.onRefresh,
    this.ignoreOffline = false,
  });

  @override
  Widget build(BuildContext context) {
    // final network = NetworkManager.instance;

    final viewsInsets = MediaQuery.of(context).viewInsets;

    // Konten yang berisi widget
    final content = SliverToBoxAdapter(
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.5),
          child: body,
        ),
      ),
    );

    // Banner offline (tidak ada koneksi internet)
    // final bannerOffline = SliverToBoxAdapter(
    //   child: Obx(
    //         () => network.isOnline ? const SizedBox() : const OfflineBanner(),
    //   ),
    // );

    final slivers = <Widget>[
      // Header locator untuk pull to refresh
      const HeaderLocator.sliver(clearExtent: false),
      // const HeaderLocator(),

      // Banner offline (tidak ada koneksi internet)
      // bannerOffline,

      // Sliver header atau appbar
      if (appbar != null) appbar!,

      // Konten body
      content,

      // Padding bawah untuk mengikuti keyboard
      if (viewsInsets.bottom > 0)
        SliverPadding(padding: EdgeInsets.only(bottom: viewsInsets.bottom)),
    ];

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: EasyRefresh.builder(
          header: const ClassicHeader(
            clipBehavior: Clip.none,
            clamping: true,
            mainAxisAlignment: MainAxisAlignment.end,
            position: IndicatorPosition.locator,
          ),
          // onRefresh: (network.isOnline || ignoreOffline) ? onRefresh : null,
          onRefresh: onRefresh,
          childBuilder: (context, physics) =>
              CustomScrollView(physics: physics, slivers: slivers),
        ),
      ),
    );
  }
}
