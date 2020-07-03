import 'package:flutter/material.dart';

//This displays the Color that the users chooses by adjusting the sliders

// var gradientColorList = [
//   Color(0xffFF512F),
//   Color(0xffC324DD),
//   Color(0xffF64F59),
//   Color(0xffFF512F),
//   Color(0xffC324DD),
//   Color(0xffF64F59),
//   Color(0xffFF512F),
//   Color(0xffC324DD),
//   Color(0xffF64F59),
//   Color(0xffFF512F)
// ];

class GradientDisplay extends StatelessWidget {
  const GradientDisplay({Key key, @required this.gradientColorList})
      : super(key: key);

  final List gradientColorList;

  @override
  Widget build(BuildContext context) {
    Color _color1 = gradientColorList.elementAt(0).value;
    Color _color2 = gradientColorList.elementAt(1).value;
    Color _color3 = gradientColorList.elementAt(2).value;
    Color _color4 = gradientColorList.elementAt(3).value;

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
                    .5, .75, 1,
                    // .125,
                    // 0.1,
                    // .1,
                    // .1,
                    // .1,
                    // .1,
                    // .1,
                    // 1
                  ],
                  colors: [
                    _color1,
                    _color2,
                    _color3,
                    _color4,
                    // gradientColorList[4],
                    // gradientColorList[5],
                    // gradientColorList[6],
                    // gradientColorList[7]
                  ]),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
        ),
      ),
    );
  }
}
