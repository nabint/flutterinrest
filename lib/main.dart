import 'package:flutter/material.dart';
import 'package:flutterinrest/services/note_service.dart';
import 'package:flutterinrest/views/note_list.dart';
import 'package:get_it/get_it.dart';

void setupLocator(){
  GetIt.I.registerLazySingleton(()=>NoteService());
}

void main() {
  setupLocator();
  runApp(App());

}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NoteList(),
    );
  }
}