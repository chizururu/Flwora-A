import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStore {
  Future<String?> read(String key);

  Future<void> write(String key, String value);

  Future<void> remove(String key);
}

class LocalStorage implements LocalStore {
  static final Future<SharedPreferences> _instance =
      SharedPreferences.getInstance();

  Future<SharedPreferences> get _prefs => _instance;

  @override
  Future<String?> read(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key);
  }

  @override
  Future<void> write(String key, String value) async {
    final prefs = await _prefs;
    await prefs.setString(key, value);
  }

  @override
  Future<void> remove(String key) async {
    final prefs = await _prefs;
    await prefs.remove(key);
  }
}
