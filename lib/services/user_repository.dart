import 'package:flutter_first_progect/models/user.dart';
import 'package:flutter_first_progect/services/user_api_provider.dart';

class UsersRepository{
  UserProvider _usersProvider = UserProvider();
  Future<List<User>> getAllUsers ()=> _usersProvider.getUser();
}