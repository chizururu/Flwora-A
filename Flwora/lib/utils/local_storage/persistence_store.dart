abstract class LocalStore {
  Future<String?> read(String key);

  Future<void> write(String key, String value);

  Future<void> remove(String key, String value);
}

class LocalStorage implements LocalStore {
  @override
  Future<String?> read(String key) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<void> remove(String key, String value) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<void> write(String key, String value) {
    // TODO: implement write
    throw UnimplementedError();
  }
}
