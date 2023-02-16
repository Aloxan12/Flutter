import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_first_progect/bloc/user_bloc.dart';
import 'package:flutter_first_progect/bloc/user_event.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserBloc _userBloc = BlocProvider.of<UserBloc>(context, listen: false);
    // final UserBloc _userBloc = context.read<UserBloc>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextButton(
          onPressed: () {
            _userBloc.add(UserLoadEvent());
          },
          child: Text('Load'),
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
          ),
        ),
        const SizedBox(width: 8),
        TextButton(
          onPressed: () {
            _userBloc.add(UserClearEvent());
          },
          child: Text('clear'),
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
          ),
        ),
      ],
    );
  }
}
