import 'package:flwora/data/sources/user_repository.dart';
import 'package:flwora/utils/http/http_result.dart';
import 'package:flwora/utils/http/http_service.dart';

class UserRepositoriesImpl implements UserRepository {
  // Login
  @override
  Future<HttpResult<Map<String, dynamic>>> login({
    required String email,
    required String password,
  }) {
    return HttpService.post(
      path: '/login',
      data: {'email': email, 'password': password},
    );
  }

  // Register
  @override
  Future<HttpResult<Map<String, dynamic>>> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    return HttpService.post(
      path: '/register',
      data: {
        'name': name,
        'email': email,
        'password': password,
        'confirm_password': confirmPassword,
      },
    );
  }
}
