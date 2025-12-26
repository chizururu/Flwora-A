abstract interface class TResponse<T> {
  final int statusCode;
  final String? statusMessage;

  const TResponse({required this.statusCode, this.statusMessage});
}

final class Success<T> extends TResponse<T> {
  final T? data;

  const Success({this.data, super.statusMessage, required super.statusCode});
}

final class Failed<T> extends TResponse<T> {
  final Map<String, dynamic>? errors;

  const Failed({super.statusMessage, this.errors, required super.statusCode});
}
