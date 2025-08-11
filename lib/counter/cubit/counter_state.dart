part of 'counter_cubit.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}
final class ChangeCounterState extends CounterState {
  // final int counter;

  // ChangeCounterState(this.counter);
}

