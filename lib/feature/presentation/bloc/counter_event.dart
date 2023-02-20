import 'package:equatable/equatable.dart';

class CounterEvent extends Equatable{
  const CounterEvent();

  @override
  List<Object?>get props => [];
}

class CounterStartEvent extends CounterEvent{}
class CounterResetEvent extends CounterEvent{}
class CounterIncrementEvent extends CounterEvent{}