import 'package:flutter/material.dart';

import 'package:colorApp/Screens/gradient.dart';

import 'package:colorApp/Logic/GradientBloc.dart';

import 'GradientRoundedRectangularSliders.dart';

//the sliders that adjust the RGB values of the color
class GradientSliders extends StatefulWidget {
  GradientSliders(
      {Key key, @required this.gradientBloc, @required this.snapshot})
      : super(key: key);
  final GradientBloc gradientBloc;
  final AsyncSnapshot snapshot;
  @override
  _GradientSlidersState createState() => _GradientSlidersState();
}

class _GradientSlidersState extends State<GradientSliders> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        children: <Widget>[
          RoundedRectangularSliderGradient(
            index: index,
            gradientBloc: this.widget.gradientBloc,
            snapshot: this.widget.snapshot,
            prefixText: 'R',
            inactiveTrackColor: Colors.red[200],
            activeTrackColor: Colors.red[700],
            thumbColor: Colors.redAccent,
            value: redValue,
          ),
          RoundedRectangularSliderGradient(
            index: index,
            gradientBloc: this.widget.gradientBloc,
            snapshot: this.widget.snapshot,
            prefixText: 'G',
            inactiveTrackColor: Colors.green[200],
            activeTrackColor: Colors.green[700],
            thumbColor: Colors.greenAccent[700],
            value: greenValue,
          ),
          RoundedRectangularSliderGradient(
            index: index,
            gradientBloc: this.widget.gradientBloc,
            snapshot: this.widget.snapshot,
            prefixText: 'B',
            inactiveTrackColor: Colors.blue[200],
            activeTrackColor: Colors.blue[700],
            thumbColor: Colors.blueAccent,
            value: blueValue,
          ),
        ],
      ),
    );
  }
}
