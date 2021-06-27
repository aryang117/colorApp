import 'package:flutter/material.dart';

import 'package:colorApp/Widgets/Gradient/GradientSliders.dart';

import 'package:colorApp/Logic/GradientBloc.dart';

// the sliders are custom and this is their definition
// Sliders for adjusting RGB values of the colors
class GradientColorSliders extends StatefulWidget {
  GradientColorSliders({
    Key key,
    @required this.gradientBloc,
    @required this.snapshot,
  }) : super(key: key);

  final GradientBloc gradientBloc;
  final AsyncSnapshot snapshot;

  @override
  _GradientColorSlidersState createState() => _GradientColorSlidersState();
}

class _GradientColorSlidersState extends State<GradientColorSliders> {
  String colorHexMaker(int red, int green, int blue) {
    return red.round().toRadixString(16) +
        green.round().toRadixString(16) +
        blue.round().toRadixString(16);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Padding(
          padding: new EdgeInsets.only(top: 10),
        ),
        Padding(
          padding: new EdgeInsets.only(top: 20),
        ),
        GradientSliders(
          gradientBloc: this.widget.gradientBloc,
          snapshot: this.widget.snapshot,
        ),
      ]),
    );
  }
}
