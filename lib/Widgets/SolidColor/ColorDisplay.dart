import 'package:flutter/material.dart';

import '/Models/SolidColorMdel.dart';

import 'package:provider/provider.dart';

//This displays the Color that the users chooses by adjusting the sliders
class ColorDisplay extends StatelessWidget {
  const ColorDisplay({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int red = Provider.of<SolidColorsModel>(context, listen: false).getRed;
    int green = Provider.of<SolidColorsModel>(context, listen: false).getGreen;
    int blue = Provider.of<SolidColorsModel>(context, listen: false).getBlue;

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
