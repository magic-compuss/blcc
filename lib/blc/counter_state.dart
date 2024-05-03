part of 'counter_bloc.dart';

 class CounterState {
   int count = 0;

   List<Products> list = [];

   CounterState({required this.list});


}


final class CounterInitial extends CounterState {
  CounterInitial({required super.list});

}
