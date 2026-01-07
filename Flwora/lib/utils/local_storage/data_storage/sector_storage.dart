import 'package:flwora/data/models/sector.dart';
import 'package:flwora/utils/local_storage/base_storage.dart';

class SectorStorage extends TBaseStorage<List<Sector>> {
  // Constructor
  SectorStorage._internal();

  // Instance tunggal
  static final SectorStorage instance = SectorStorage._internal();

  @override
  // TODO: implement key
  String get key => 'app.sector';

  @override
  List<Sector> fromJson(json) => (json as List<dynamic>)
      .cast<Map<String, dynamic>>()
      .map((sector) => Sector.fromJson(sector))
      .toList();

  @override
  toJson(List<Sector> item) => item.map((sector) => sector.toJson()).toList();
}
