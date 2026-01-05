import 'package:flwora/utils/http/t_response.dart';

abstract class UserRepository {
  Future<TResponse<Map<String, dynamic>>> updateProfile({required String name});

  Future<TResponse<Map<String, dynamic>>> updateCredentials({
    required String password,
    required String confirmPassword,
  });
}
