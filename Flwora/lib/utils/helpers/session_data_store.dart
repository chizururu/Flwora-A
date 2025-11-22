import 'dart:async';

import 'package:flwora/utils/http/http_service.dart';
import 'package:flwora/utils/local_storage/data_storage/user_storage.dart';
import 'package:get/get.dart';

class SessionDataStore extends GetxController {
  final RxString sessionToken = ''.obs;
  final RxString sessionUserId = ''.obs;

  // Stream untuk mendapatkan user secara realtime dan sinkron
  StreamSubscription? _user;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    // Sinkron dengan UserStorage
    _user = UserStorage.instance.stream.listen((user) {
      final newToken = user?.token ?? '';
      final newUserId = user?.id.toString() ?? '';

      // Hindari emit secara berulang jika token sama
      // if (sessionToken.value == newToken) return;
      // if (sessionUserId.value == newUserId) return;

      if (newToken.isNotEmpty && sessionToken.value != newToken) {
        sessionToken.value = newToken;
        print(newToken);
      }

      if (newUserId.isNotEmpty && sessionUserId.value != newUserId) {
        sessionUserId.value = newUserId;
        print(newUserId);
      }
    });

    // Update header http dengan memasukkan token bearer laravel
    ever<String>(sessionToken, (value) => HttpService.updateTokenHeader(value));
  }

  // Token saat ini digunakan untuk mengirim perintah ke perangkat keras
  String get token => sessionToken.value;

  String get userId => sessionUserId.value;

  // Tentukan apakah sudah autentikasi (punya token)
  bool get isAuthenticated => sessionToken.value.isNotEmpty;

  @override
  void onClose() {
    // TODO: implement onClose
    _user?.cancel();
    super.onClose();
  }
}
