import 'package:flwora/data/sources/sector_repository.dart';
import 'package:flwora/data/sources/user_repository.dart';
import 'package:flwora/utils/http/http_result.dart';
import 'package:flwora/utils/http/http_service.dart';

class SectorRepositoriesImpl implements SectorRepository {
  @override
  Future<HttpResult<Map<String, dynamic>>> add({required String name}) {
    // TODO: implement add
    return HttpService.post(path: '/sector', data: {'name': name});
  }

  @override
  Future<HttpResult<Map<String, dynamic>>> update({
    required int id,
    required String name,
  }) {
    // TODO: implement update
    return HttpService.patch(path: '/sector/$id', data: {'name': name});
  }

  @override
  Future<HttpResult<void>> delete({required id}) {
    // TODO: implement delete
    return HttpService.delete(path: '/sector/$id');
  }
}
