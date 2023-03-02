import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_first_progect/Navigate/fifth_page.dart';
import 'package:flutter_first_progect/Navigate/fourth_page.dart';
import 'package:flutter_first_progect/Navigate/navigate_home_page.dart';
import 'package:flutter_first_progect/Navigate/second_page.dart';
import 'package:flutter_first_progect/Navigate/third_page.dart';
import 'package:flutter_first_progect/Weather/home_page.dart';
import 'package:flutter_first_progect/bloc_observable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  Bloc.observer = CharacterBlocObservable();
  HydratedBlocOverrides.runZoned(
        () => runApp(const MyApp()),
    blocObserver: CharacterBlocObservable(),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Counter',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.black,
          fontFamily: 'Georgia',
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
            headline2: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
            headline3: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
                color: Colors.white),
            bodyText1: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w200,
                color: Colors.white),
            bodyText2: TextStyle(
                fontSize: 11.0,
                fontWeight: FontWeight.w100,
                color: Colors.grey),
          ),
        ),
        home: const NavigateHomePage(title: 'Navigator apps'),
        routes: {
          '/page2': (context)=> const SecondScreenPage(),
          '/page3': (context)=> ThirdScreenPage(),
          '/page4': (context)=> const FourthScreenPage(),
          '/page5': (context)=> const FifthScreenPage(),
        },
    );
  }
}
