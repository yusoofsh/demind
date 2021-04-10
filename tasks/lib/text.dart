import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  const Content({
    Key key,
    @required String text,
  })  : _content = text,
        super(key: key);

  final String _content;

  @override
  Widget build(BuildContext context) {
    return Text(_content);
  }
}
