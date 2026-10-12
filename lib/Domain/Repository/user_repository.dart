import 'package:mobility/Domain/Entity/user.dart';

abstract class UserRepository {
  Future<List<User>> getUser();
}
