import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceUtils {
  static void hideKeyboard([BuildContext? context]) {
    context != null
        ? FocusScope.of(context).unfocus()
        : Get.focusScope?.unfocus();
  }
}
