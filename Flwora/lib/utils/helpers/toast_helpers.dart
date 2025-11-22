import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

class TToastHelper {
  // Constructor
  TToastHelper._();

  static ToastificationItem customToast({required String message}) {
    return toastification.show();
  }

  static ToastificationItem progressToast({required String message}) {
    return toastification.show();
  }

  // Success
  // Menutup toast tertentu
  static close(ToastificationItem item) {
    toastification.dismiss(item);
  }
}
