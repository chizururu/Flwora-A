import 'package:flwora/utils/http/http_service.dart';
import 'package:flwora/utils/local_storage/data_storage/user_storage.dart';
import 'package:get/get.dart';

class SessionDataStore extends GetxController {
  final sessionToken = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadStoredToken();

    // Setiap token berubah update header di http service
    ever(sessionToken, (value) {
      HttpService.updateTokenHeader(value);
    });
  }

  Future<void> loadStoredToken() async {
    final user = await UserStorage.instance.get();
    sessionToken.value = user?.token ?? '';
  }

  // Ambil session token
  String get token => sessionToken.value;

  // Bool get yang akan menentukan apakah sudah terautentikasi
  bool get isAuthenticated => sessionToken.value.isNotEmpty;
}
