import 'package:flutter/material.dart';

class Control extends StatelessWidget {
  const Control({
    Key key,
    this.control,
  }) : super(key: key);

  final VoidCallback control;

  @override
  Widget build(context) {
    return TextButton(
      onPressed: control,
      child: Text('Change Text'),
    );
  }
}
