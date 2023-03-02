import 'package:flutter/material.dart';
import 'package:flutter_first_progect/Navigate/navigate_home_page.dart';

class ThirdScreenPage extends StatelessWidget {
  User? user;

  ThirdScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    RouteSettings? setting = ModalRoute.of(context)?.settings;
    user = setting?.arguments as User;
    return Scaffold(
      appBar: AppBar(
        title: Text('third screen ${user?.name}'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('go back'),
        ),
      ),
    );
  }
}