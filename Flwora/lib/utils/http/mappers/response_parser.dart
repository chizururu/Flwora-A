class ResponseParser {
  ResponseParser._();

  static String? message(dynamic payload) =>
      (payload is Map && payload['message'] is String)
      ? payload['message'] as String
      : null;

  static Map<String, dynamic>? errors(dynamic payload) =>
      (payload is Map && payload['errors'] is Map)
      ? Map<String, dynamic>.from(payload['errors'] as Map)
      : null;

  static Map<String, dynamic>? data(dynamic payload) =>
      (payload is Map && payload['data'] is Map)
      ? Map<String, dynamic>.from(payload['data'] as Map)
      : null;
}
