import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UiUtils {
  UiUtils._();

  static void dismissKeyboard([BuildContext? context]) => context != null
      ? FocusScope.of(context).unfocus()
      : Get.focusScope?.unfocus();

  static EdgeInsets viewInsets([BuildContext? context]) => context != null
      ? MediaQuery.of(context).viewInsets
      : Get.mediaQuery.viewInsets;

  static double getWidth([BuildContext? context]) => context != null
      ? MediaQuery.of(context).size.width
      : Get.mediaQuery.size.width;

  static double getHeight([BuildContext? context]) => context != null
      ? MediaQuery.of(context).size.height
      : Get.mediaQuery.size.height;
}
