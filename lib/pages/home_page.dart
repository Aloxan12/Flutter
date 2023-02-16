import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_first_progect/bloc/user_bloc.dart';
import 'package:flutter_first_progect/bloc/user_event.dart';
import 'package:flutter_first_progect/cubit/internet_cubit.dart';
import 'package:flutter_first_progect/services/user_repository.dart';

import '../widgets/action-buttons.dart';
import '../widgets/user_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final usersRepository = UsersRepository(); заменили на RepositoryProvider

    return RepositoryProvider(
      create: (context) => UsersRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                UserBloc(usersRepository: context.read<UsersRepository>())
                  ..add(UserLoadEvent()),
          ),
          BlocProvider(create: (context) => ConnectionCubit())
        ],
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: BlocBuilder<ConnectionCubit, MyConnectionState>(
              builder: (context, state) => state.connected
                  ? Text('User List(в сети)')
                  : Text('Нет соеденения с интернетом', style: TextStyle(color: Colors.red),),
            ),
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ActionButtons(),
              Expanded(child: UserList()),
            ],
          ),
        ),
      ),
    );
  }
}
