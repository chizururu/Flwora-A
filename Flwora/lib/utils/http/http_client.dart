import 'package:dio/dio.dart';
import 'package:flwora/utils/constants/endpoints.dart';
import 'package:flwora/utils/http/http_response.dart';

class THttpClient {
  const THttpClient._();

  // Inisialisasi pada DIO
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "${Endpoints.baseUrl}/api",
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  static Future<TResponse<T>> _req<T>({
    required Future<Response<dynamic>> Function() call,
  }) async {
    final res = await call();

    return Success(statusCode: 0);
  }

  static Future<TResponse<T>> get<T>({required String path}) async =>
      _req(call: () => _dio.get(path));

  static Future<TResponse<T>> post<T>({
    required String path,
    required Object data,
  }) => _req(call: () => _dio.post(path, data: data));

  static Future<TResponse<T>> patch<T>({
    required String path,
    required Object data,
  }) async => _req(call: () => _dio.patch(path, data: data));

  static Future<TResponse<T>> delete<T>({required String path}) =>
      _req(call: () => _dio.delete(path));
}
