import 'package:mobility/Domain/Entity/user.dart';
import 'package:mobility/Domain/Repository/user_repository.dart';

final class GetUserUseCase {
  final UserRepository userRepository;

  GetUserUseCase(this.userRepository);

  Future<List<User>> execute() => userRepository.getUser();
}
