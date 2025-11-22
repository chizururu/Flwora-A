import 'package:flwora/utils/http/http_result.dart';

abstract class SectorRepository {
  // Add
  Future<HttpResult<Map<String, dynamic>>> add({required String name});

  // Update
  Future<HttpResult<Map<String, dynamic>>> update({
    required int id,
    required String name,
  });

  // Delete
  Future<HttpResult<void>> delete({required int id});
}
