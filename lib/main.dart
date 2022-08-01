import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projet_bloc/bloc/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      home:  Interface( 'Flutter Bloc'),
    );
  }
}
class Interface extends StatelessWidget{
  final String title;
  CounterBloc bloc=CounterBloc();
  Interface (this.title);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: StreamBuilder(
        stream: bloc.stream,
        builder: (context, snapshot){
          return
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('boutton appuyé' ,style: TextStyle(fontSize: 32), textAlign: TextAlign.center,),
                Text("${snapshot.data}",style: TextStyle(fontSize: 32), textAlign: TextAlign.center,)
              ],
          ),
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => bloc.incrementCounter(),
      ),
    );
  }
}


