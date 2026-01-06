import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late final StreamSubscription<List<ConnectivityResult>>
  _connectivitySubscription;
  final RxList<ConnectivityResult> _connectionStatus =
      <ConnectivityResult>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initializeConnectivity();
  }

  Future<void> _initializeConnectivity() async {
    try {
      _connectionStatus.assignAll(await _connectivity.checkConnectivity());
    } on PlatformException {
      _connectionStatus.assignAll(const [ConnectivityResult.none]);
    }

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _connectionStatus.assignAll,
    );
  }

  bool get hasNetworkConnection =>
      _connectionStatus.any((r) => r != ConnectivityResult.none);

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
