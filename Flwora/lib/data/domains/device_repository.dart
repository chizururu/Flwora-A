import 'package:flwora/utils/http/t_response.dart';

abstract class DeviceRepository {
  Future<TResponse<Map<String, dynamic>>> moveToSector({
    required String id,
    required int sectorId,
  });
}
