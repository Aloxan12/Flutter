import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_first_progect/bloc/user_bloc.dart';
import 'package:flutter_first_progect/bloc/user_state.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserEmptyState) {
          return const Center(
              child: Text(
                'No data received. Please button "Load"',
                style: TextStyle(fontSize: 20),
              ),
          );
        }
        if (state is UserLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserLoadedState) {
          return ListView.builder(
            itemCount: state.loadedUser.length,
            itemBuilder: (context, index) => Container(
              child: ListTile(
                leading: Text(
                  'ID: ${state.loadedUser[index].id}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                title: Column(
                  children: <Widget>[
                    Text(
                      '${state.loadedUser[index].name}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Email: ${state.loadedUser[index].email}',
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                        Text(
                          'Phone: ${state.loadedUser[index].phone}',
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        if (state is UserErrorState) {
          return const Center(
            child: Text(
              'Error fetching users',
              style: TextStyle(fontSize: 20),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
