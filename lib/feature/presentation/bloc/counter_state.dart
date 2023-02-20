import 'package:equatable/equatable.dart';

class CounterState extends Equatable{
  const CounterState();

  @override
  List<Object?> get props => [];
}

class CounterInitialState extends CounterState{}
class CounterLoadingState extends CounterState{}
class CounterLoadedState extends CounterState{
  final int counter;

  const CounterLoadedState({required this.counter});

  @override
  List<Object?> get props => [counter];
}