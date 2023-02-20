import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => context),
      child: const MaterialApp(
          title: 'Counter',
          home: Center(
            child: Text('Rick and morty'),
          )),
    );
  }
}
