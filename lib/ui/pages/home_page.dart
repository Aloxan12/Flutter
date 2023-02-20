import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_first_progect/bloc/character_bloc.dart';
import 'package:flutter_first_progect/data/repositories/character_repo.dart';
import 'package:flutter_first_progect/ui/pages/search_page.dart';

class HomePage extends StatelessWidget{
  HomePage({Key? key, required this.title }) : super(key: key);
  final String title;
  final repository = CharacterRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        centerTitle: true,
        title: Text(title, style: Theme.of(context).textTheme.headline3,),
      ),
      body: BlocProvider(
        create: ((context) => CharacterBloc(characterRepo: repository)),
        child: SearchPage(),
      ),
    );
  }
}