import 'package:flwora/utils/http/t_response.dart';

abstract class SectorRepository {
  Future<TResponse<Map<String, dynamic>>> create({required String name});

  Future<TResponse<Map<String, dynamic>>> update({
    required String id,
    required String name,
  });

  Future<TResponse<Map<String, dynamic>>> delete({required String id});
}
