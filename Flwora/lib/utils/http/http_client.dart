import 'package:dio/dio.dart';
import 'package:flwora/utils/constants/endpoint.dart';
import 'package:flwora/utils/http/t_response.dart';

class THttpClient {
  const THttpClient._();

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "${Server.baseUrl}/api",
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      validateStatus: (statusCode) =>
          statusCode != null && statusCode >= 200 && statusCode < 300,
    ),
  );

  static void setAuthToken(String token) =>
      _dio.options.headers['Authorization'] = 'Bearer $token';

  static String? _extractMessage(dynamic payload) =>
      payload is Map && payload['message'] is String
      ? payload['message'] as String
      : null;

  static Future<TResponse<T>> _request<T>({
    required Future<Response> Function() action,
  }) async {
    try {
      final response = await action();
      final code = response.statusCode as int;
      final payload = response.data;

      final message = _extractMessage(payload);

      final Object? raw = (payload is Map && payload['data'] is Map)
          ? payload['data']
          : null;

      T? data;
      if (raw is T) data = raw;

      return TResponseSuccess(message: message, data: data, code: code);
    } on DioException catch (e) {
      final response = e.response;
      final code = response?.statusCode as int;
      final payload = response?.data;

      if (payload != null || code != 0) {
        final message = _extractMessage(payload);

        final errors = (payload is Map && payload['errors'] is Map)
            ? Map<String, dynamic>.from(payload['errors'] as Map)
            : null;

        return TResponseFailed(message: message, errors: errors, code: code);
      }

      return TResponseFailed(
        message: "Ups, ada kendala. Silahkan coba lagi.",
        code: 0,
      );
    }
  }

  static Future<TResponse<T>> get<T>({required String path}) async =>
      _request(action: () => _dio.get(path));

  static Future<TResponse<T>> post<T>({
    required String path,
    required Map<String, dynamic> data,
  }) async => _request(action: () => _dio.post(path, data: data));

  static Future<TResponse<T>> patch<T>({
    required String path,
    required Map<String, dynamic> data,
  }) async => _request(action: () => _dio.patch(path, data: data));

  static Future<TResponse<T>> delete<T>({required String path}) async =>
      _request(action: () => _dio.delete(path));
}
