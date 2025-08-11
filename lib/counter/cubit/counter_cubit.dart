import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

int counter=0;

incrementCounter(){
  counter++;
  emit(ChangeCounterState());
}

decrementCounter(){
  counter--;
  emit(ChangeCounterState());
}

resetCounter(){
  counter=0;
  emit(ChangeCounterState());
}

}
