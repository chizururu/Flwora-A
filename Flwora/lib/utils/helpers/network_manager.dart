import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();

  late final StreamSubscription<List<ConnectivityResult>>
  _connectivityStreamSubscription;

  final RxList<ConnectivityResult> _connectionStatus =
      <ConnectivityResult>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _initializeConnectivity();
  }

  Future<void> _initializeConnectivity() async {
    final status = await _connectivity.checkConnectivity();
    _connectionStatus.assignAll(status);

    _connectivityStreamSubscription = _connectivity.onConnectivityChanged
        .listen(
          (List<ConnectivityResult> status) =>
              _connectionStatus.assignAll(status),
        );
  }

  bool get isOnline =>
      _connectionStatus.any((result) => result != ConnectivityResult.none);

  @override
  void onClose() {
    // TODO: implement onClose
    _connectivityStreamSubscription.cancel();
    super.onClose();
  }
}
