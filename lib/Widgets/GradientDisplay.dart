import 'package:colorApp/Models/GradientModel.dart';
import 'package:flutter/material.dart';

//This displays the Color that the users chooses by adjusting the sliders

class GradientDisplay extends StatefulWidget {
  const GradientDisplay(
      {Key key,
      @required this.color1,
      @required this.color2,
      @required this.color3,
      @required this.color4})
      : super(key: key);

  // final AsyncSnapshot gradientColorList;
  final GradientModel color1;
  final GradientModel color2;
  final GradientModel color3;
  final GradientModel color4;

  @override
  _GradientDisplayState createState() => _GradientDisplayState();
}

class _GradientDisplayState extends State<GradientDisplay> {
  @override
  Widget build(BuildContext context) {
    final Color _color1 = Color.fromRGBO(
        widget.color1.red, widget.color1.green, widget.color1.blue, 1);
    final Color _color2 = Color.fromRGBO(
        widget.color2.red, widget.color2.green, widget.color2.blue, 1);
    final Color _color3 = Color.fromRGBO(
        widget.color3.red, widget.color3.green, widget.color3.blue, 1);
    final Color _color4 = Color.fromRGBO(
        widget.color4.red, widget.color4.green, widget.color4.blue, 1);

    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: new EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Align(
        alignment: Alignment.topCenter,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Container(
            height: 0.5 * screenHeight,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
                  .25,
                  .5,
                  .75,
                  1,
                ],
                colors: [
                  _color1,
                  _color2,
                  _color3,
                  _color4,
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
        ),
      ),
    );
  }
}
