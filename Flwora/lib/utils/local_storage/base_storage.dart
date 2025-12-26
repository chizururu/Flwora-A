import 'package:rxdart/rxdart.dart';

abstract interface class BaseStorage<T> {
  // Key digunakan untuk menyimpan data
  String get key;

  // Subject untuk menyimpan dan broadcast nilai terbaru secara reaktif.
  final _subject = BehaviorSubject<T>();

  // Muat data dari storage, kemudian decode hingga push data ke stream.
  Future<void> _load() async {}

  // Hapus data yang tersimpan dan broadcast null ke stream.
  Future<void> clear() async {}
}
