import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// enum ColorEvent {
//   evetn_red,
//   evetn_green,
// }

abstract class ColorEvent {
}

class RedColorEvent extends ColorEvent{}

class GreenColorEvent extends ColorEvent{}

class ColorBlocWithBloC extends Bloc<ColorEvent, Color> {
  Color _color = Colors.red;

  ColorBlocWithBloC() : super(Colors.red) {
    on<RedColorEvent>((event, emit) => emit(Colors.red));
    on<GreenColorEvent>((event, emit) => emit(Colors.green));
  }
}

// class ColorBloc{
//   Color _color = Colors.red;
//
//   final _inputEventController = StreamController<ColorEvent>();
//   StreamSink<ColorEvent> get inputEventSink => _inputEventController.sink;
//
//   final _outputStateController = StreamController<Color>();
//   Stream<Color> get outputStateStream => _outputStateController.stream;
//
//   void _mapEventToState(ColorEvent event){
//     if(event == ColorEvent.evetn_red) _color = Colors.red;
//     else if(event == ColorEvent.evetn_green) _color = Colors.green;
//     else throw Exception('Wrong event types');
//
//     _outputStateController.sink.add(_color);
//   }
//
//   ColorBloc(){
//     _inputEventController.stream.listen(_mapEventToState);
//   }
//   void dispose(){
//     _inputEventController.close();
//     _outputStateController.close();
//   }
// }
