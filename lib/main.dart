import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_first_progect/pages/home_page.dart';

import 'color_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorBlocWithBloC(),
      child: MaterialApp(title: 'Flutter', home: HomePage()),
    );
  }
}

