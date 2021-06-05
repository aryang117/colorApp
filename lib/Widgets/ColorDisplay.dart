import 'package:flutter/material.dart';

//This displays the Color that the users chooses by adjusting the sliders
class ColorDisplay extends StatelessWidget {
  const ColorDisplay(
      {Key key, @required this.red, @required this.green, @required this.blue})
      : super(key: key);

  final int red;
  final int green;
  final int blue;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: new EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Align(
        alignment: Alignment.topCenter,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          //color: Color.fromRGBO(red, green, blue, 1),
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(red, green, blue, 1),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            height: 0.5 * screenHeight,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}
