import 'package:flutter/material.dart';

import 'package:colorApp/Screens/home.dart';

//These are the sliders that allow the user to change colors
class ColorSliders extends StatefulWidget {
  @override
  _ColorSlidersState createState() => _ColorSlidersState();
}

class _ColorSlidersState extends State<ColorSliders> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Column(
        children: <Widget>[
          Slider(
            label: red.value.toString(),
            value: red.value.toDouble(),
            min: 0,
            max: 255,
            divisions: 255,
            onChanged: (double _newvalue) {
              setState(() {
                print(_newvalue.toInt());
                red.value = _newvalue.toInt();
              });
            },
          ),
          Slider(
            label: green.value.toString(),
            value: green.value.toDouble(),
            min: 0,
            max: 255,
            divisions: 255,
            onChanged: (double _newvalue) {
              setState(() {
                print(_newvalue.toInt());
                green.value = _newvalue.toInt();
              });
            },
          ),
          Slider(
            label: blue.value.toString(),
            value: blue.value.toDouble(),
            min: 0,
            max: 255,
            divisions: 255,
            onChanged: (double _newvalue) {
              setState(() {
                print(_newvalue.toInt());
                blue.value = _newvalue.toInt();
              });
            },
          ),
        ],
      ),
    );
  }
}
