import 'package:flutter/material.dart';

//This displays the Color that the users chooses by adjusting the sliders

var gradientColorList = [
  Color(0xffFF512F),
  Color(0xffC324DD),
  // Color(0xffF64F59)
];

class GradientDisplay extends StatelessWidget {
  const GradientDisplay(
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
          child: Container(
            height: 0.5 * screenHeight,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                  //   stops: [
                  //   .25,
                  //   0.66,
                  //   1
                  // ],
                  colors: [
                    gradientColorList[0],
                    gradientColorList[1],
                    // gradientColorList[2],
                  ]),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
        ),
      ),
    );
  }
}
