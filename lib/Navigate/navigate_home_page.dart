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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: (){
                User user = User(name: 'Alex', age: 28);
                Navigator.push(context, MaterialPageRoute(builder: ((context) => SecondScreenPage(user: user,))));
              },
              child: const Text('Go to second screen'),
            ),
            TextButton(
              onPressed: (){
                Navigator.pushNamed(context, '/page3');
              },
              child: const Text('Go to third screen'),
            ),
          ],
        )
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

class ThirdScreenPage extends StatelessWidget{
  const ThirdScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('third screen'),),
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
  final String name;
  final int age;

  User({required this.name, required this.age});
}