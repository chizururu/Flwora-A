import 'package:flwora/data/domains/device_repository.dart';
import 'package:flwora/routers/api_routes.dart';
import 'package:flwora/utils/http/http_client.dart';
import 'package:flwora/utils/http/t_response.dart';

class DeviceRepositoryImpl extends DeviceRepository {
  @override
  Future<TResponse<Map<String, dynamic>>> moveToSector({
    required String id,
    required int sectorId,
  }) => THttpClient.patch(
    path: '${ApiRoutes.device}/$id',
    data: {'sector_id': sectorId},
  );
}
