import 'package:flutter/material.dart';
import 'package:flutter_first_progect/Navigate/navigate_home_page.dart';

class SecondScreenPage extends StatelessWidget {
  final User? user;

  const SecondScreenPage({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page ${user?.name} ${user?.age}'),
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