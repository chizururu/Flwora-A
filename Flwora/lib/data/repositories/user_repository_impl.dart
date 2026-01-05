import 'package:flwora/data/domains/user_repository.dart';
import 'package:flwora/routers/api_routes.dart';
import 'package:flwora/utils/http/http_client.dart';
import 'package:flwora/utils/http/t_response.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<TResponse<Map<String, dynamic>>> updateProfile({
    required String name,
  }) => THttpClient.patch(
    path: ApiRoutes.user,
    data: {'name': name, 'action': 'update_user_profile'},
  );

  @override
  Future<TResponse<Map<String, dynamic>>> updateCredentials({
    required String password,
    required String confirmPassword,
  }) => THttpClient.patch(
    path: ApiRoutes.user,
    data: {
      'password': password,
      'confirm_password': confirmPassword,
      'action': 'update_user_credentials',
    },
  );
}
