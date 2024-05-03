import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../Model.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial( list: [])) {
    on<Increment>((event, emit) {
     var c = state.count;
     c++;
     emit (CounterState( list: []));
    });



    on<getuser>((event, emit) async {
      var url = Uri.https('https://dummyjson.com/products?limit=50');
      var response = await http.post(url);
      if (response.statusCode == 200) {
       var json = jsonDecode(response.body);
       var list = Model.fromJson(json);
       var josnlist = list.products as List<Products>;
       emit (CounterState( list: josnlist));
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load album');
      }
    });
  }
}
