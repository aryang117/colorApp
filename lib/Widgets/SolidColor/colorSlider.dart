import 'package:flutter/material.dart';

import '/Models/SolidColorMdel.dart';

import 'package:provider/provider.dart';
import '../RoundedRectangularThumb.dart';

//FOR SOLID COLOR
//the sliders that adjust the RGB values of the color
class SolidColorSliders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SolidColorsModel colorProvider = Provider.of<SolidColorsModel>(context);
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        children: <Widget>[
          RoundedRectangularSliderSolidColor(
            prefixText: 'R',
            inactiveTrackColor: Colors.red[200],
            activeTrackColor: Colors.red[700],
            thumbColor: Colors.redAccent,
            value: colorProvider.getRed.toDouble(),
          ),
          RoundedRectangularSliderSolidColor(
            prefixText: 'G',
            inactiveTrackColor: Colors.green[200],
            activeTrackColor: Colors.green[700],
            thumbColor: Colors.greenAccent[700],
            value: colorProvider.getGreen.toDouble(),
          ),
          RoundedRectangularSliderSolidColor(
            prefixText: 'B',
            inactiveTrackColor: Colors.blue[200],
            activeTrackColor: Colors.blue[700],
            thumbColor: Colors.blueAccent,
            value: colorProvider.getBlue.toDouble(),
          ),
        ],
      ),
    );
  }
}

// the sliders are custom and this is their definition
class RoundedRectangularSliderSolidColor extends StatelessWidget {
  const RoundedRectangularSliderSolidColor(
      {Key key,
      this.prefixText,
      this.inactiveTrackColor,
      this.activeTrackColor,
      this.thumbColor,
      this.value})
      : super(key: key);

  final Color inactiveTrackColor;
  final Color activeTrackColor;
  final Color thumbColor;
  final String prefixText;
  final double value;

  double rgbValue() {
    if (this.prefixText.toUpperCase() == 'R')
      return value;
    else if (this.prefixText.toUpperCase() == 'G')
      return this.value;
    else if (this.prefixText.toUpperCase() == 'B') return this.value;

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: this.activeTrackColor,
        inactiveTrackColor: this.inactiveTrackColor,
        trackShape: RectangularSliderTrackShape(),
        trackHeight: 4.0,
        thumbShape: SliderRoundedRectangularThumb(
            thumbHeight: 40,
            thumbRadius: 2,
            min: 0,
            max: 255,
            prefixText: this.prefixText,
            thumbTextStyle: Theme.of(context).textTheme.bodyText2),
        thumbColor: this.thumbColor,
        overlayColor: this.activeTrackColor.withAlpha(32),
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
            SolidColorsModel colorProvider =
                Provider.of<SolidColorsModel>(context, listen: false);

            switch (this.prefixText) {
              case 'R':
                {
                  colorProvider.updateRed(value.toInt());
                  //red.value = value.toInt();
                  //print("red: " + red.value.toString());
                }
                break;
              case 'G':
                {
                  colorProvider.updateGreen(value.toInt());
                  // green.value = value.toInt();
                  // print("green: " + green.value.toString());
                }
                break;
              case 'B':
                {
                  colorProvider.updateBlue(value.toInt());
                  // blue.value = value.toInt();
                  // print("blue: " + blue.value.toString());
                }
                break;
              default:
            }
          }),
    );
  }
}
