import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_first_progect/feature/presentation/bloc/counter_bloc.dart';
import 'package:flutter_first_progect/feature/presentation/bloc/counter_event.dart';
import 'package:flutter_first_progect/feature/presentation/pages/counter_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => CounterBloc()..add(CounterStartEvent())),
      child: MaterialApp(
          title: 'Counter',
          home: Center(
            child: CounterPage(),
          )),
    );
  }
}
