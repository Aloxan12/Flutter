import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_first_progect/bloc/character_bloc.dart';
import 'package:flutter_first_progect/data/models/character.dart';
import 'package:flutter_first_progect/ui/widgets/custom_list_tile.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Character _currentCharacter;
  List<Results> _currentResults = [];
  int _currentPage = 1;
  String _currentSearchStr = '';

  @override
  void initState() {
    if (_currentResults.isEmpty) {
      context
          .read<CharacterBloc>()
          .add(const CharacterEvent.fetch(name: '', page: 1));
    }
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
        Padding(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 16, right: 16),
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
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              hintText: 'Search name',
              hintStyle: const TextStyle(color: Colors.white),
            ),
            onChanged: (value) {
              _currentPage = 1;
              _currentResults = [];
              _currentSearchStr = value;

              context
                  .read<CharacterBloc>()
                  .add(CharacterEvent.fetch(name: value, page: _currentPage));
            },
          ),
        ),
        Expanded(
          child: state.when(
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
                _currentCharacter = characterLoaded;
                _currentResults = characterLoaded.results;

                return _currentResults.isNotEmpty
                    ? _customListView(_currentResults)
                    : const SizedBox();
              },
              error: () => const Text('Nothing found...')),
        ),
      ],
    );
  }

  Widget _customListView(List<Results> currentResults) {
    return Padding(
      padding: EdgeInsets.only(right: 16, left: 16, top: 3, bottom: 3),
      child: ListView.separated(
        separatorBuilder: (_, index) => const SizedBox(
          height: 5,
        ),
        itemCount: currentResults.length,
        itemBuilder: (context, index) {
          final character = currentResults[index];
          return CustomListTile(character: character);
        },
      ),
    );
  }
}
