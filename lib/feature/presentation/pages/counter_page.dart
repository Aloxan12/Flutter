import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_first_progect/feature/presentation/bloc/counter_bloc.dart';
import 'package:flutter_first_progect/feature/presentation/bloc/counter_event.dart';
import 'package:flutter_first_progect/feature/presentation/bloc/counter_state.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        centerTitle: true,
      ),
      body: const Center(
        child: _CounterText(),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(CounterIncrementEvent()),
            tooltip: 'inc',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(CounterResetEvent()),
            tooltip: 'reset',
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}

class _CounterText extends StatelessWidget {
  const _CounterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CounterBloc>().state;
    if(state is CounterInitialState){
      return const FlutterLogo(size: 150,);
    }else if(state is CounterLoadingState){
      return const CircularProgressIndicator();
    }else if(state is CounterLoadedState){
      return Text('${state.counter}',);
    }
    return const SizedBox.shrink();
  }
}
