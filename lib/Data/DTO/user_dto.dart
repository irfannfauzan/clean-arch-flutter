import 'package:mobility/Domain/Entity/user.dart';

class UserDTO {
  final int id;
  final int userId;
  final String title;
  final String body;

  UserDTO({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  User toDomain() => User(id: id, userId: userId, title: title, body: body);
}
