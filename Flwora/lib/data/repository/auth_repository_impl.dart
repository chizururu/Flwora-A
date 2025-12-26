import 'package:flwora/data/domain/auth_repository.dart';
import 'package:flwora/utils/http/http_response.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<TResponse<Map<String, dynamic>>> login({
    required String email,
    required String password,
  }) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<TResponse<Map<String, dynamic>>> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
