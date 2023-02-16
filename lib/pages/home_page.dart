import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_first_progect/bloc/user_bloc.dart';
import 'package:flutter_first_progect/bloc/user_event.dart';
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
      child: BlocProvider(
        create: (context) =>
            UserBloc(usersRepository: context.read<UsersRepository>())..add(UserLoadEvent()),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('User list'),
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
