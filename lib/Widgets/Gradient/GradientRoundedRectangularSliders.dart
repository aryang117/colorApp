import 'package:flutter/material.dart';

import 'package:colorApp/Screens/gradient.dart';
import 'package:colorApp/Widgets/RoundedRectangularThumb.dart';

import 'package:colorApp/Models/GradientModel.dart';
import 'package:colorApp/Logic/GradientBloc.dart';

// the sliders are custom and this is their definition
class RoundedRectangularSliderGradient extends StatefulWidget {
  const RoundedRectangularSliderGradient(
      {Key key,
      this.index,
      this.gradientBloc,
      this.snapshot,
      this.prefixText,
      this.inactiveTrackColor,
      this.activeTrackColor,
      this.thumbColor,
      this.value})
      : super(key: key);

  final ValueNotifier<int> index;
  final GradientBloc gradientBloc;
  final AsyncSnapshot snapshot;
  final Color inactiveTrackColor;
  final Color activeTrackColor;
  final Color thumbColor;
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
      return this.widget.snapshot.data[widget.index.value].red.toDouble();
    else if (this.widget.prefixText.toUpperCase() == 'G')
      return this.widget.snapshot.data[widget.index.value].green.toDouble();
    else if (this.widget.prefixText.toUpperCase() == 'B')
      return this.widget.snapshot.data[widget.index.value].blue.toDouble();

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: this.widget.activeTrackColor,
        inactiveTrackColor: this.widget.inactiveTrackColor,
        trackShape: RectangularSliderTrackShape(),
        trackHeight: 4.0,
        thumbShape: SliderRoundedRectangularThumb(
            thumbHeight: 40,
            thumbRadius: 2,
            min: 0,
            max: 255,
            prefixText: this.widget.prefixText,
            thumbTextStyle: Theme.of(context).textTheme.bodyText2),
        thumbColor: this.widget.thumbColor,
        overlayColor: this.widget.activeTrackColor.withAlpha(32),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
        showValueIndicator: ShowValueIndicator.never,
        valueIndicatorShape: PaddleSliderValueIndicatorShape(),
        valueIndicatorColor: Colors.redAccent,
        valueIndicatorTextStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      child: Slider(
          label: rgbValue().toString(),
          value: rgbValue(),
          min: 0,
          max: 255,
          divisions: 255,
          onChanged: (double value) {
            setState(() {
              if (this.widget.prefixText == 'R') {
                redValue = value;
                print("red: " + redValue.toString());
              }
              if (this.widget.prefixText == 'G') {
                greenValue = value;
                print("green: " + greenValue.toString());
              }
              if (this.widget.prefixText == 'B') {
                blueValue = value;
                print("blue: " + blueValue.toString());
              }
              this.widget.gradientBloc.getGradientColorChange.add(GradientModel(
                  widget.index.value,
                  redValue.toInt(),
                  greenValue.toInt(),
                  blueValue.toInt()));
            });
          }),
    );
  }
}
