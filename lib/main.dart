import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Rick and Morty',
        home: Center(
          child: Text('Rick and Morty'),
        ));
  }
}
