import 'package:flwora/data/domains/auth_repository.dart';
import 'package:flwora/routers/api_routes.dart';
import 'package:flwora/utils/http/http_client.dart';
import 'package:flwora/utils/http/t_response.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<TResponse<Map<String, dynamic>>> login({
    required String email,
    required String password,
  }) => THttpClient.post(
    path: ApiRoutes.login,
    data: {'email': email, 'password': password},
  );

  @override
  Future<TResponse<Map<String, dynamic>>> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) => THttpClient.post(
    path: ApiRoutes.register,
    data: {
      'name': name,
      'email': email,
      'password': password,
      'confirm_password': confirmPassword,
    },
  );
}
