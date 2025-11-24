import 'package:flutter/material.dart';
import 'package:flwora/utils/constants/colors.dart';
import 'package:get/get.dart';

class BottomSheetHelper {
  static Future<T?> show<T>({
    required Widget child,
    bool isScrollControlled = true,
  }) => showModalBottomSheet(
    context: Get.context!,
    isScrollControlled: isScrollControlled,
    barrierColor: TColors.barrier,
    backgroundColor: Colors.transparent,
    builder: (context) {
      final viewInsets = MediaQuery.of(context).viewInsets;

      return Container(
        margin: const EdgeInsets.all(12),
        padding: EdgeInsets.only(bottom: viewInsets.bottom + 5),
        child: Align(alignment: AlignmentGeometry.bottomCenter, child: child),
      );
    },
  );
}
