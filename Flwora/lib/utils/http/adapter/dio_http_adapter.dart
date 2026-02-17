import 'package:dio/dio.dart';
import 'package:flwora/utils/http/http_client.dart';
import 'package:flwora/utils/http/mappers/response_mapper.dart';
import 'package:flwora/utils/results/response.dart';

class DioHttpAdapter implements HttpClient {
  final Dio dio;
  final ResponseMapper mapper;

  DioHttpAdapter({required this.dio, required this.mapper});

  @override
  Future<TResponse<T>> get<T>({required String path}) async {
    try {
      final response = await dio.get(path);
      return mapper.mapSuccess<T>(response);
    } on DioException catch (e) {
      return mapper.mapError<T>(e);
    }
  }

  @override
  Future<TResponse<T>> post<T>({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await dio.post(path, data: data);
      return mapper.mapSuccess<T>(response);
    } on DioException catch (e) {
      return mapper.mapError(e);
    }
  }

  @override
  Future<TResponse<T>> patch<T>({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await dio.patch(path, data: data);
      return mapper.mapSuccess<T>(response);
    } on DioException catch (e) {
      return mapper.mapError(e);
    }
  }

  @override
  Future<TResponse<T>> delete<T>({
    required String path,
  }) async {
    try {
      final response = await dio.delete(path);
      return mapper.mapSuccess<T>(response);
    } on DioException catch (e) {
      return mapper.mapError<T>(e);
    }
  }
}
