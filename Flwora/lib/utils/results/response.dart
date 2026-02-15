abstract class TResponse<T> {
  final int code;
  final String? message;

  const TResponse({required this.code, this.message});
}

class TResponseSuccess<T> extends TResponse<T> {
  final T? data;

  const TResponseSuccess({this.data, super.message, required super.code});
}

class TResponseFailed<T> extends TResponse<T> {
  final Map<String, dynamic>? errors;

  const TResponseFailed({this.errors, super.message, required super.code});
}
