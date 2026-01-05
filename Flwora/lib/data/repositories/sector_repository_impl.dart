import 'package:flwora/data/domains/sector_repository.dart';
import 'package:flwora/routers/api_routes.dart';
import 'package:flwora/utils/http/http_client.dart';
import 'package:flwora/utils/http/t_response.dart';

class SectorRepositoryImpl extends SectorRepository {
  @override
  Future<TResponse<Map<String, dynamic>>> create({required String name}) =>
      THttpClient.post(path: ApiRoutes.sector, data: {'name': name});

  @override
  Future<TResponse<Map<String, dynamic>>> update({
    required String id,
    required String name,
  }) =>
      THttpClient.patch(path: '${ApiRoutes.sector}/$id', data: {'name': name});

  @override
  Future<TResponse<Map<String, dynamic>>> delete({required String id}) =>
      THttpClient.delete(path: '${ApiRoutes.sector}/$id');
}
