import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        child: TextButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: ((context) => const SecondScreenPage())));
          },
          child: const Text('Go to second screen'),
        ),
      ),
    );
  }
}


class SecondScreenPage extends StatelessWidget{
  final User? user;
  const SecondScreenPage({Key? key, this.user}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second page ${user?.name} ${user?.age}'),),
      body: Center(
        child: TextButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: const Text('go back'),
        ),
      ),
    );
  }
}

class User {
  final String? name;
  final int? age;

  User({this.name, this.age});
}