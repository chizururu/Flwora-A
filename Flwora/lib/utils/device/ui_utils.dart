import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UiUtils {
  const UiUtils._();

  // Tutup keyboard saat menekan tombol
  static void dismissKeyboard([BuildContext? context]) => context != null
      ? FocusScope.of(context).unfocus()
      : Get.focusScope?.unfocus();

  // Ambil viewInsets
  static EdgeInsets viewInsets([BuildContext? context]) => context != null
      ? MediaQuery.of(context).viewInsets
      : Get.mediaQuery.viewInsets;

  // Ambil lebar layar
  static double getWidth([BuildContext? context]) => context != null
      ? MediaQuery.of(context).size.width
      : Get.mediaQuery.size.width;

  // Ambil tinggi lebar
  static double getHeight([BuildContext? context]) => context != null
      ? MediaQuery.of(context).size.height
      : Get.mediaQuery.size.height;
}
