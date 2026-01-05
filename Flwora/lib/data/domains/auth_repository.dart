import 'package:flwora/utils/http/t_response.dart';

abstract class AuthRepository {
  Future<TResponse<Map<String, dynamic>>> login({
    required String email,
    required String password,
  });

  Future<TResponse<Map<String, dynamic>>> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  });
}
