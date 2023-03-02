import 'package:flutter/material.dart';

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