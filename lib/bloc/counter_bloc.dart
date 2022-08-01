import 'dart:async';

import 'bloc.dart';

class CounterBloc extends Bloc {

  int counter =0;
  CounterBloc(){
    sink.add(counter);
  }
  //Stream Controller
  final _streamController =StreamController<int>();

  //Entrées
  Sink<int> get sink => _streamController.sink;

  //Sorties
  Stream<int> get stream => _streamController.stream;

  //BusinessLogic
  incrementCounter(){
    counter +=1;
    sink.add(counter);
  }


  @override
  dispose() => _streamController.close();


}