import 'package:flwora/utils/results/response.dart';

abstract class HttpClient {
  Future<TResponse<T>> get<T>({required String path});

  Future<TResponse<T>> post<T>({
    required String path,
    required Map<String, dynamic> data,
  });

  Future<TResponse<T>> patch<T>({
    required String path,
    required Map<String, dynamic> data,
  });

  Future<TResponse<T>> delete<T>({
    required String path,
  });
}
