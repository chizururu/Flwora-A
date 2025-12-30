abstract interface class LocalStore {
  Future<String?> readData(String key);

  Future<void> writeData(String key, String value);

  Future<void> removeData(String key, String value);
}

class LocalStorage implements LocalStore {
  @override
  Future<String?> readData(String key) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<void> writeData(String key, String value) {
    // TODO: implement write
    throw UnimplementedError();
  }

  @override
  Future<void> removeData(String key, String value) {
    // TODO: implement remove
    throw UnimplementedError();
  }
}
