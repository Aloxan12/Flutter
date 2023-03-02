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
        ],
      )),
    );
  }
}

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

class FourthScreenPage extends StatefulWidget {
  const FourthScreenPage({super.key});

  @override
  State<FourthScreenPage> createState() => _FourthScreenPage();
}

class _FourthScreenPage extends State<FourthScreenPage> {
  String text = 'Some text';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('fourth screen'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(text),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('go back'),
            ),
            TextButton(
              onPressed: () {
                _returnDataFromFifthScreen(context);
              },
              child: const Text('go on the fifth page'),
            ),
          ],
        ),
      ),
    );
  }
  void _returnDataFromFifthScreen (BuildContext context) async{
    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => const FifthScreenPage(),));
    setState(() {
      text = result;
    });
  }
}

class FifthScreenPage extends StatefulWidget {
  const FifthScreenPage({super.key});

  @override
  State<FifthScreenPage> createState() => _FifthScreenPage();
}

class _FifthScreenPage extends State<FifthScreenPage> {
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('fourth screen'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: textFieldController,
                style: const TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                String textToSendBack = textFieldController.text;
                Navigator.pop(context, textToSendBack);
              },
              child: const Text('go back'),
            ),
          ],
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
