import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_app/counter/cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: const MyHomePage(title: 'State Management'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(
                  context.read<CounterCubit>().counter.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            BlocListener<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state is ChangeCounterState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Counter changed: ${context.read<CounterCubit>().counter}',
                      ),
                      duration: const Duration(seconds: 1),
                      backgroundColor: Colors.indigo,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                    ),
                    behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
              child: SizedBox.shrink(),
            )
         
         
          ],
       
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().incrementCounter();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().resetCounter();
            },
            tooltip: 'Reset',
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().decrementCounter();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
