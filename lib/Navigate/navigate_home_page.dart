import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_progect/Navigate/second_page.dart';

class NavigateHomePage extends StatelessWidget {
  final String title;

  const NavigateHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Navigation',
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton(
            onPressed: () {
              User user = User(name: 'Alex', age: 28);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => SecondScreenPage(
                            user: user,
                          ))));
            },
            child: const Text('Go to second screen'),
          ),
          TextButton(
            onPressed: () {
              User user = User(name: 'Jon', age: 27);
              Navigator.pushNamed(context, '/page3', arguments: user);
            },
            child: const Text('Go to third screen'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/page4');
            },
            child: const Text('Go to fourth screen'),
          ),
        ],
      )),
    );
  }
}

class User {
  final String name;
  final int age;

  User({required this.name, required this.age});
}
