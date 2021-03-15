import 'package:snapchat_proj/models/user.dart';
import 'package:snapchat_proj/services/user_provider.dart';

class UsersRepository {
  final UserProvider _usersProvider = UserProvider();
  Future<List<User>> getAllUsers() => _usersProvider.getUser();
}
