import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_first_progect/data/models/character.dart';
import 'package:flutter_first_progect/data/repositories/character_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_bloc.freezed.dart';

// part 'character_bloc.g.dart';
part 'character_state.dart';

part 'character_event.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterRepo characterRepo;

  CharacterBloc({required this.characterRepo})
      : super(const CharacterState.loading()) {
    on<CharacterEventFetch>((event, emit) async {
      try {
        emit(const CharacterState.loading());
        Character _characterLoaded =
            await characterRepo.getCharacter(event.page, event.name);
        emit(CharacterState.loaded(characterLoaded: _characterLoaded));
      } catch (e) {
        emit(const CharacterState.error());
      }
    });
  }
}