import 'package:dio/dio.dart';
import 'package:flwora/utils/constants/server.dart';
import 'package:flwora/utils/http/http_result.dart';

class HttpService {
  // Constructor
  HttpService._();

  // Inisialisasi pada Dio
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "${TServer.url}/api",
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
      validateStatus: (statusCode) =>
          statusCode != null && statusCode >= 200 && statusCode < 300,
    ),
  );

  // Fungsi simpan token
  static void updateTokenHeader(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  // Request http secara generik
  static Future<HttpResult<T>> _request<T>({
    required Future<Response> Function() call,
  }) async {
    try {
      final response = await call();
      final statusCode = response.statusCode ?? 0;
      final body = response.data;

      // Ambil pesan dari body['message'] atau statusMessage
      final String? message = (body is Map && body['message'] is String)
          ? body['message'] as String
          : response.statusMessage;

      // Ambil data dari body['data'] jika ada, bisa null
      final Object? raw = (body is Map && body.containsKey('data'))
          ? body['data']
          : null;

      // Casting data ke T jika
      T? data;
      if (raw is T) data = raw;

      return HttpSuccess<T>(message, data, statusCode: statusCode);
    } on DioException catch (e) {
      final response = e.response;
      final statusCode = response?.statusCode ?? 0;
      final body = response?.data;

      // Jika server merespons dengan error dan body
      if (body != null || statusCode != 0) {
        // Ambil pesan error dari api
        final String? message = (body is Map && body['message'] is String)
            ? body['message'] as String
            : null;

        // Ambil field error bila ada
        final errors = (body is Map && body['errors'] is Map)
            ? Map<String, dynamic>.from(body['errors'] as Map)
            : null;

        return HttpFailed<T>(message, errors, statusCode: statusCode);
      }

      return HttpFailed<T>(
        'Terjadi kesalahan, silahkan coba lagi',
        null,
        statusCode: 0,
      );
    }
  }

  // GET
  static Future<HttpResult<T>> get<T>({required String path}) async =>
      _request(call: () => _dio.get(path));

  // POST
  static Future<HttpResult<T>> post<T>({
    required String path,
    required Map<String, dynamic> data,
  }) => _request(call: () => _dio.post(path, data: data));

  // PATCH
  static Future<HttpResult<T>> patch<T>({
    required String path,
    required Map<String, dynamic> data,
  }) => _request(call: () => _dio.patch(path, data: data));

  // DELETE
  static Future<HttpResult<T>> delete<T>({required String path}) =>
      _request(call: () => _dio.delete(path));
}
