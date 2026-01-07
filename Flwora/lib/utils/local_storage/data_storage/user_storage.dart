import 'package:flwora/data/models/user.dart';
import 'package:flwora/utils/local_storage/base_storage.dart';

class UserStorage extends TBaseStorage<User> {
  // Constructor
  UserStorage._internal();

  // Instance tunggal
  static final UserStorage instance = UserStorage._internal();

  @override
  // TODO: implement key
  String get key => 'app.user';

  @override
  User fromJson(json) => User.fromJson(json);

  @override
  toJson(User item) => item.toJson();
}
