import 'package:flutter/material.dart';

//return color code in HEX, not being used anymore
class ColorCode extends StatelessWidget {
  const ColorCode(
      {Key key, @required this.red, @required this.green, @required this.blue})
      : super(key: key);

  final int red;
  final int green;
  final int blue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: new EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width - 20,
      child: MaterialButton(
        color: Color(0xff252525),
        onPressed: null,
        child: Text(
          "# " +
              red.toRadixString(16) +
              green.toRadixString(16) +
              blue.toRadixString(16),
          style: new TextStyle(
              color: Colors.white,
              fontSize: Theme.of(context).textTheme.headline5.fontSize),
        ),
      ),
    );
  }
}
