import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mstblc/bloc/counter_bloc.dart';
import 'package:mstblc/cubit/counter_cubit.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return BlocBuilder<CounterBloc, int>(
        bloc: counterBloc,
        builder: (context, counter) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text("Flutter Home Page Demo"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${counter}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    counterBloc.add(CounterIncremented());
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 15),
                FloatingActionButton(
                  onPressed: () {
                    counterBloc.add(CounterDecremented());
                  },
                  tooltip: 'decrement',
                  child: const Icon(Icons.minimize_outlined),
                ),
              ],
            ),
          );
        });
  }
}
