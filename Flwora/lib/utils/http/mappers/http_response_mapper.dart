import 'package:dio/dio.dart';
import 'package:flwora/utils/http/mappers/response_mapper.dart';
import 'package:flwora/utils/http/mappers/response_parser.dart';
import 'package:flwora/utils/results/response.dart';

class HttpResponseMapper implements ResponseMapper {
  @override
  TResponse<T> mapSuccess<T>(Response<dynamic> response) {
    final code = response.statusCode as int;
    final payload = response.data;

    return TResponseSuccess(
      code: code,
      message: ResponseParser.message(payload),
      data: ResponseParser.data(payload) as T,
    );
  }

  @override
  TResponse<T> mapError<T>(DioException error) {
    final response = error.response;
    final code = response?.statusCode ?? 0;
    final payload = response?.data;

    return TResponseFailed(
      code: code,
      message: ResponseParser.message(payload),
      errors: ResponseParser.errors(payload),
    );
  }
}
