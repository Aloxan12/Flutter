import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_first_progect/bloc/character_bloc.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    context
        .read<CharacterBloc>()
        .add(const CharacterEventFetch(name: '', page: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CharacterBloc>().state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(padding: const EdgeInsets.only(top: 15, bottom: 15, left: 16, right: 16),
        child: TextField(
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromRGBO(86, 86, 86, 0.8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            prefixIcon: const Icon(Icons.search, color: Colors.white,),
            hintText: 'Search name',
            hintStyle: const TextStyle(color: Colors.white),
          ),
          onChanged: (value){
            context.read<CharacterBloc>().add(CharacterEvent.fetch(name: value, page: 1));
          },
        ),),
        state.when(
            loading: () {
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    CircularProgressIndicator(strokeWidth: 2),
                    SizedBox(width: 10),
                    Text('Loading...'),
                  ],
                ),
              );
            },
            loaded: (characterLoaded) {
              return Text('${characterLoaded.info}');
            },
            error: () => const Text('Nothing found...')),
      ],
    );
  }
}
