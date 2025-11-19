abstract class HttpResult<T> {
  final int statusCode;

  // Constructor
  HttpResult({required this.statusCode});
}

class HttpSuccess<T> extends HttpResult<T> {
  final String? message;
  final T? data;

  // Constructor
  HttpSuccess(this.message, this.data, {required super.statusCode});
}

class HttpFailed<T> extends HttpResult<T> {
  final String? message;
  final Map<String, dynamic>? error;

  // Constructor
  HttpFailed(this.message, this.error, {required super.statusCode});
}
