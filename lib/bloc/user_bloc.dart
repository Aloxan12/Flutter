import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_first_progect/bloc/user_event.dart';
import 'package:flutter_first_progect/bloc/user_state.dart';
import 'package:flutter_first_progect/models/user.dart';
import 'package:flutter_first_progect/services/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  final UsersRepository usersRepository;

  UserBloc({required this.usersRepository}):super(UserEmptyState()){
    on<UserLoadEvent>((event, emit) async{
      emit(UserLoadingState());
      try{
        final List<User> loadedUserList = await usersRepository.getAllUsers();
        emit(UserLoadedState(loadedUser: loadedUserList));
      }catch(_){
        emit(UserErrorState());
      }
    });
    on<UserClearEvent>((event, emit) async {
      emit(UserEmptyState());
    });
  }
}