import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question({required this.questionText});

  final String questionText;

  @override
  Widget build(context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
