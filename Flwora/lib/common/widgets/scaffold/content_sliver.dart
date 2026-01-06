import 'package:flutter/material.dart';
import 'package:flwora/utils/constants/sizes.dart';

class ContentSliver extends StatelessWidget {
  final Widget content;

  const ContentSliver({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    final contentPadding = Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.lg),
      child: content,
    );

    return content is TabBarView
        ? SliverFillRemaining(child: content)
        : SliverToBoxAdapter(child: contentPadding);
  }
}
