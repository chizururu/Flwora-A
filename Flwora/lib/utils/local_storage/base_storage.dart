import 'dart:convert';

import 'package:flwora/utils/local_storage/persistence_store.dart';
import 'package:rxdart/rxdart.dart';

abstract class TBaseStorage<T> {
  final LocalStore store;

  // Constructor
  TBaseStorage({LocalStore? store}) : store = store ?? LocalStorage();

  // Key unik penyimpanan
  String get key;

  // Subject yang menyimpan dan broadcast nilai terbaru secara reaktif
  final _subject = BehaviorSubject<T?>();

  // Status penanda apakah sudah memuat data dari storage sebelumnya
  bool _loaded = false;

  // Future untuk menghindarkan proses memuat yang tumpang tindih.
  Future<void>? _loadingFuture;

  // Konversi data dalam format JSON menjadi object
  T fromJson(dynamic json);

  // Konversi data dalam format object menjadi JSON
  dynamic toJson(T item);

  // Stream reaktif yang broadcasting nilai terkini
  ValueStream<T?> get stream {
    _ensureLoaded();
    return _subject.stream;
  }

  // Mengonfirmasi proses memuat data hanya dilakukan sekali (cegah double load)
  Future<void> _ensureLoaded() async {
    if (_loaded) return Future.value();
    if (_loadingFuture != null) return _loadingFuture!;
    _loadingFuture = _load();

    return _loadingFuture!;
  }

  // Memuat data dari storage, decode, dan push ke stream.
  Future<void> _load() async {
    try {
      final raw = await store.read(key);
      if (raw != null) {
        final decoded = _safeDecode(raw);
        if (decoded != null) {
          _subject.add(decoded);
        } else {
          // Jika data korup atau cacat, maka hapus dan ganti jadi null
          await store.remove(key);
          _subject.add(null);
        }
      }
      _loaded = true;
    } finally {
      _loadingFuture = null;
    }
  }

  // Simpan data ke storage dan broadcast ke stream
  Future<void> storeItem(T value) async {
    await _ensureLoaded();
    final raw = jsonEncode(toJson(value));
    await store.write(key, raw);
    _subject.add(value);
  }

  // Menghapus data yang tersimpan dan broadcast null ke stream
  Future<void> clear() async {
    await store.remove(key);
    _subject.add(null);
  }

  // Safe decoder untuk mencegah data kerusakan data diakibatkan korup atau parsing gagal dengan mengembalikan nilai null
  T? _safeDecode(String raw) {
    try {
      final json = jsonDecode(raw);
      return fromJson(json);
    } catch (_) {
      return null;
    }
  }
}
