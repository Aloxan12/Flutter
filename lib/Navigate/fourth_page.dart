import 'package:flutter/material.dart';
import 'package:flutter_first_progect/Navigate/fifth_page.dart';

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
        title: const Text('fifth screen'),
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

  void _returnDataFromFifthScreen(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FifthScreenPage(),
        ));
    setState(() {
      text = result;
    });
  }
}
