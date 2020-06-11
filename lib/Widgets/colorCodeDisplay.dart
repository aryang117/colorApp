import 'package:flutter/material.dart';

class ColorCode extends StatelessWidget {
  const ColorCode(
      {Key key, @required this.red, @required this.green, @required this.blue})
      : super(key: key);

  final int red;
  final int green;
  final int blue;

  @override
  Widget build(BuildContext context) {
    return Text(
      "# " +
          red.toRadixString(16) +
          green.toRadixString(16) +
          blue.toRadixString(16),
      style: new TextStyle(
          color: Colors.white,
          fontSize: Theme.of(context).textTheme.headline5.fontSize),
    );
  }
}
