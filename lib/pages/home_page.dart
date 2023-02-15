import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/action-buttons.dart';
import '../widgets/user_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
