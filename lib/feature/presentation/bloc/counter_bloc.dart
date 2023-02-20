import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_first_progect/feature/presentation/bloc/counter_event.dart';
import 'package:flutter_first_progect/feature/presentation/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc(): super(CounterInitialState()){
    on<CounterStartEvent>((event, emit) async{
      await Future.delayed(const Duration(milliseconds: 5000));
      emit(const CounterLoadedState(counter: 0));
    });
    on<CounterResetEvent>((event, emit) async{
      emit(CounterLoadingState());
      await Future.delayed(const Duration(milliseconds: 1500));
      emit(const CounterLoadedState(counter: 0));
    });
    on<CounterIncrementEvent>((event, emit) async{
      if(state is CounterLoadedState){
        final counter = (state as CounterLoadedState).counter;
        emit(CounterLoadingState());
        await Future.delayed(const Duration(milliseconds: 500));
        emit(CounterLoadedState(counter: counter + 1));
      }
      await Future.delayed(const Duration(milliseconds: 5000));
      emit(const CounterLoadedState(counter: 0));
    });
  }
}