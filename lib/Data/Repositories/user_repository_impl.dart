import 'package:mobility/Data/DataSource/user_remote_data_source.dart';
import 'package:mobility/Domain/Entity/user.dart';
import 'package:mobility/Domain/Repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl(this.userRemoteDataSource);

  @override
  Future<List<User>> getUser() async {
    final response = await userRemoteDataSource.getUser();
    return response.map((e) => e.toDomain()).toList();
  }
}
