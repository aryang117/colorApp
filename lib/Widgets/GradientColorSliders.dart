import 'package:flutter/material.dart';

import 'package:colorApp/Logic/GradientBloc.dart';
import 'package:colorApp/Models/GradientModel.dart';
import 'package:colorApp/Widgets/RoundedRectangularThumb.dart';

TextStyle formStyle = new TextStyle(
  fontSize: 20,
  color: Colors.white,
);

int _index = 0;

double _redValue = 0;
double _greenValue = 0;
double _blueValue = 0;

class GradientColorSliders extends StatefulWidget {
  GradientColorSliders(
      {Key key, @required this.gradientBloc, @required this.snapshot})
      : super(key: key);

  final GradientBloc gradientBloc;
  final AsyncSnapshot snapshot;

  @override
  _GradientColorSlidersState createState() => _GradientColorSlidersState();
}

class _GradientColorSlidersState extends State<GradientColorSliders> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff212121),
      child: Column(children: <Widget>[
        DropdownButton(
          items: <int>[1, 2, 3, 4].map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text(value.toString()),
            );
          }).toList(),
          // value: _index,
          onChanged: (newValue) {
            setState(() {
              _index = newValue - 1;

              print('Value = ' + newValue.toString());
              print('Color' +
                  newValue.toString() +
                  "=" +
                  _redValue.toString() +
                  _greenValue.toString() +
                  _blueValue.toString());
            });
          },
        ),
        GradientSliders(
          gradientBloc: this.widget.gradientBloc,
          snapshot: this.widget.snapshot,
        ),
      ]),
    );
  }
}

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
            gradientBloc: this.widget.gradientBloc,
            snapshot: this.widget.snapshot,
            prefixText: 'R',
            activeColor: Colors.red,
            activeTrackColor: Colors.red[700],
            value: _redValue,
          ),
          RoundedRectangularSliderGradient(
            gradientBloc: this.widget.gradientBloc,
            snapshot: this.widget.snapshot,
            prefixText: 'G',
            activeColor: Colors.green,
            activeTrackColor: Colors.green[700],
            value: _greenValue,
          ),
          RoundedRectangularSliderGradient(
            gradientBloc: this.widget.gradientBloc,
            snapshot: this.widget.snapshot,
            prefixText: 'B',
            activeColor: Colors.blue,
            activeTrackColor: Colors.blue[700],
            value: _blueValue,
          ),
        ],
      ),
    );
  }
}

class RoundedRectangularSliderGradient extends StatefulWidget {
  const RoundedRectangularSliderGradient(
      {Key key,
      this.gradientBloc,
      this.snapshot,
      this.prefixText,
      this.activeColor,
      this.activeTrackColor,
      this.value})
      : super(key: key);

  final GradientBloc gradientBloc;
  final AsyncSnapshot snapshot;
  final Color activeColor;
  final Color activeTrackColor;
  final String prefixText;
  final double value;

  @override
  _RoundedRectangularSliderGradientState createState() =>
      _RoundedRectangularSliderGradientState();
}

class _RoundedRectangularSliderGradientState
    extends State<RoundedRectangularSliderGradient> {
  double rgbValue() {
    if (this.widget.prefixText.toUpperCase() == 'R')
      return this.widget.snapshot.data[_index].red.toDouble();
    else if (this.widget.prefixText.toUpperCase() == 'G')
      return this.widget.snapshot.data[_index].green.toDouble();
    else if (this.widget.prefixText.toUpperCase() == 'B')
      return this.widget.snapshot.data[_index].blue.toDouble();

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: this.widget.activeTrackColor,
        inactiveTrackColor: Colors.red[100],
        trackShape: RectangularSliderTrackShape(),
        trackHeight: 4.0,
        thumbShape: SliderRoundedRectangularThumb(
            thumbHeight: 40,
            thumbRadius: 2,
            min: 0,
            max: 255,
            prefixText: this.widget.prefixText),
        thumbColor: Colors.redAccent,
        overlayColor: Colors.red.withAlpha(32),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
        showValueIndicator: ShowValueIndicator.never,
        valueIndicatorShape: PaddleSliderValueIndicatorShape(),
        valueIndicatorColor: Colors.redAccent,
        valueIndicatorTextStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      child: Slider(
          activeColor: this.widget.activeColor,
          label: rgbValue().toString(),
          value: rgbValue(),
          min: 0,
          max: 255,
          divisions: 255,
          onChanged: (double value) {
            setState(() {
              if (this.widget.prefixText == 'R') {
                _redValue = value;
                print(_redValue);
              }
              if (this.widget.prefixText == 'G') {
                _greenValue = value;
                print(_greenValue);
              }
              if (this.widget.prefixText == 'B') {
                _blueValue = value;
                print(_blueValue);
              }
              this.widget.gradientBloc.getGradientColorChange.add(GradientModel(
                  _index,
                  _redValue.toInt(),
                  _greenValue.toInt(),
                  _blueValue.toInt()));

              print(_redValue.toString() +
                  ' ' +
                  _greenValue.toString() +
                  ' ' +
                  _blueValue.toString() +
                  "hehe" +
                  this.widget.snapshot.data[_index].red.toString() +
                  this.widget.snapshot.data[_index].green.toString() +
                  this.widget.snapshot.data[_index].blue.toString());
            });
          }),
    );
  }
}
