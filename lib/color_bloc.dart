
import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent{
  evetn_red,
  evetn_green,
}

class ColorBloc{
  Color _color = Colors.red;

  final _inputEventController = StreamController<ColorEvent>();
  StreamSink<ColorEvent> get inputEventSink => _inputEventController.sink;

  final _outputStateController = StreamController<Color>();
  Stream<Color> get outputStateStream => _outputStateController.stream;

  void _mapEventToState(Color event){
    if(event == ColorEvent.evetn_red) _color = Colors.red;
    else if(event == ColorEvent.evetn_green) _color = Colors.green;
    else throw Exception('Wrong event types');
  }
}