import 'dart:convert';

import 'package:flwora/utils/local_storage/preferences_service.dart';
import 'package:rxdart/rxdart.dart';

abstract class TBaseStorage<T> {
  final TKeyValueStore store;

  // Key unique untuk penyimpanan data
  String get key;

  // BehaviorSubject untuk memancarkan perubahan nilai secara reaktif
  final _subject = BehaviorSubject<T?>();

  bool _loaded = false;

  T fromJson(dynamic json);

  dynamic toJson(T item);

  // Constructor
  TBaseStorage({TKeyValueStore? store}) : store = store ?? TSharedPrefsStore();

  // Stream
  ValueStream<T?> get stream {
    _ensureLoaded();
    return _subject.stream;
  }

  // Ambil data terakhir
  T? get value => _subject.valueOrNull;

  Future<void> _ensureLoaded() async {
    if (_loaded) return;
    final raw = await store.getString(key);
    if (raw != null) {
      final decoded = _safeDecode(raw);

      decoded != null ? _subject.add(decoded) : await store.remove(key);
    }
    _loaded = true;
  }

  // Ambil data saat ini
  Future<T?> get() async {
    await _ensureLoaded();
    return value;
  }

  // Simpan data dan broadcast ke stream
  Future<void> storeItem(T value) async {
    await _ensureLoaded();
    final raw = jsonEncode(toJson(value));
    await store.setString(key, raw);
    _subject.add(value);
  }

  // Hapus data yang sudah tersimpan dan set broadcast data null
  Future<void> clear() async {
    await store.remove(key);
    _subject.add(null);
  }

  // Safe decode
  T? _safeDecode(String raw) {
    try {
      final json = jsonDecode(raw);
      return fromJson(json);
    } catch (_) {
      return null;
    }
  }
}
