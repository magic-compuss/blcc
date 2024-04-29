import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial(count: 0)) {
    on<Increment>((event, emit) {
     var c = state.count;
     c++;
     emit (CounterState(count: c));
    });
  }
}
