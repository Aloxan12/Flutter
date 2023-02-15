import 'package:flutter/foundation.dart';
import 'package:flutter_first_progect/models/user.dart';

abstract class UserState{}

class UserEmptyState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  List<User> loadedUser;
  UserLoadedState({required this.loadedUser});
}

class UserErrorState extends UserState {}