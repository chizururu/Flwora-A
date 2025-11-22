import 'package:flwora/data/models/sector.dart';
import 'package:flwora/utils/local_storage/base_storage.dart';

class SectorStorage extends TBaseStorage<List<Sector>> {
  // Constructor
  SectorStorage._internal({super.store});

  // Instance tunggal
  static final SectorStorage instance = SectorStorage._internal();

  // Instance global
  factory SectorStorage._() => instance;

  @override
  // TODO: implement key
  String get key => 'app.sector';

  @override
  List<Sector> fromJson(json) => (json as List<dynamic>)
      .cast<Map<String, dynamic>>()
      .map((v) => Sector.fromJson(v))
      .toList();

  @override
  toJson(List<Sector> item) => item.map((v) => v.toJson()).toList();
}
