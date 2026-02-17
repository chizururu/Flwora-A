import 'package:dio/dio.dart';
import 'package:flwora/utils/results/response.dart';

abstract class ResponseMapper {
  TResponse<T> mapSuccess<T>(Response response);

  TResponse<T> mapError<T>(DioException error);
}
