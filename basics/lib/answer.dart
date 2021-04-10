import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  const Answer(
    this.selectHandler,
    this.answerText,
  );

  @override
  Widget build(context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          textStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
