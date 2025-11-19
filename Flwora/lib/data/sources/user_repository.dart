import 'package:flwora/utils/http/http_result.dart';

abstract class UserRepository {
  // Login
  Future<HttpResult<Map<String, dynamic>>> login({
    required String email,
    required String password,
  });

  // Register
  Future<HttpResult<Map<String, dynamic>>> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  });
}
