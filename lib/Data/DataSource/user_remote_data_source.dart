import 'package:dio/dio.dart';
import 'package:mobility/Data/DTO/user_dto.dart';

abstract class UserRemoteDataSource {
  Future<List<UserDTO>> getUser();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  static const _baseUrl = "https://jsonplaceholder.typicode.com/posts";
  final Dio dio;

  UserRemoteDataSourceImpl(this.dio);

  @override
  Future<List<UserDTO>> getUser() async {
    final response = await dio.get(_baseUrl);
    return (response.data as List)
        .map((e) => UserDTO.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
