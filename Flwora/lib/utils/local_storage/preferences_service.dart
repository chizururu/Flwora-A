import 'package:shared_preferences/shared_preferences.dart';

abstract class TKeyValueStore {
  Future<String?> getString(String key);

  Future<void> setString(String key, String value);

  Future<void> remove(String key);
}

class TSharedPrefsStore implements TKeyValueStore {
  @override
  Future<String?> getString(String key) async {
    // TODO: implement getString
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  Future<void> setString(String key, String value) async {
    // TODO: implement setString
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  @override
  Future<void> remove(String key) async {
    // TODO: implement remove
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
