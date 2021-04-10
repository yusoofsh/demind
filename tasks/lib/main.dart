// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text

import 'package:flutter/material.dart';

import 'control.dart';
import 'text.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _text = 'Hello Max';

  void _control() {
    setState(
      () {
        _text = 'Hello Academind';
      },
    );
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('First Task'),
        ),
        body: Column(
          children: [
            Content(text: _text),
            Control(control: _control),
          ],
        ),
      ),
    );
  }
}
