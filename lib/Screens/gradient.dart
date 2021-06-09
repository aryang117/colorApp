import 'package:colorApp/Widgets/exchangeIcon.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:colorApp/Widgets/colorSaveBoxes.dart'; //redundant, moved all its code here
import 'package:colorApp/Widgets/SolidColor/colorCodeDisplay.dart'; //redundant, moved all its code here
import 'package:colorApp/Widgets/Gradient/GradientColorSliders.dart'; //redundant, moved all its code here
import 'package:colorApp/Widgets/Gradient/GradientDisplay.dart';

import 'package:colorApp/Models/GradientModel.dart';
import 'package:colorApp/Logic/GradientBloc.dart';

import 'package:colorApp/Widgets/RoundedRectangularThumb.dart';

//index for different colors
ValueNotifier<int> _index = ValueNotifier(0);

// Main Gradient Class,
class GradientColor extends StatefulWidget {
  @override
  _GradientColorState createState() => _GradientColorState();
}

class _GradientColorState extends State<GradientColor> {
  final GradientBloc _gradientBloc = new GradientBloc();
  @override
  void dispose() {
    _gradientBloc.dispose();
    super.dispose();
  }

  String colorHexMaker(int red, int green, int blue) {
    return red.round().toRadixString(16) +
        green.round().toRadixString(16) +
        blue.round().toRadixString(16);
  }

  @override
  Widget build(BuildContext context) {
    //double screenheight = MediaQuery.of(context).size.height; - not using anymore, will be removed in future

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,

      //Using the bloc model for Gradient which refreshes value for the colors after change
      body: StreamBuilder<List<GradientModel>>(
          stream: _gradientBloc.getGradientStream,

          //Initial Data Doesn't do anything, all colors start with #000,
          initialData: [
            GradientModel(0, 200, 0, 0),
            GradientModel(1, 0, 200, 0),
            GradientModel(3, 0, 0, 200),
            GradientModel(4, 0, 0, 0),
          ],
          builder: (BuildContext context,
              AsyncSnapshot<List<GradientModel>> snapshot) {
            if (snapshot.hasData == false) {
              print('Error! No data!');
              return Text('error null data');
            } else {
              return SingleChildScrollView(
                child: Column(children: <Widget>[
                  GradientDisplay(
                    color1: snapshot.data[0],
                    color2: snapshot.data[1],
                    color3: snapshot.data[2],
                    color4: snapshot.data[3],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ColorSelectorButtons(
                          index: 0,
                          colorHex: colorHexMaker(
                            snapshot.data[0].red,
                            snapshot.data[0].green,
                            snapshot.data[0].blue,
                          ),
                        ),
                        ColorSelectorButtons(
                          index: 1,
                          colorHex: colorHexMaker(
                            snapshot.data[1].red,
                            snapshot.data[1].green,
                            snapshot.data[1].blue,
                          ),
                        ),
                        ColorSelectorButtons(
                          index: 2,
                          colorHex: colorHexMaker(
                            snapshot.data[2].red,
                            snapshot.data[2].green,
                            snapshot.data[2].blue,
                          ),
                        ),
                        ColorSelectorButtons(
                          index: 3,
                          colorHex: colorHexMaker(
                            snapshot.data[3].red,
                            snapshot.data[3].green,
                            snapshot.data[3].blue,
                          ),
                        ),

                        //Bloc Model doesn't refresh data automatically
                        //(the data is a 2D list, but only elements are modified NOT the WHOLE 2D List, so BLoC doesn't refresh it automatically)
                        // this setState refreshes the whole widget
                        Container(
                          width: (MediaQuery.of(context).size.width - 132) / 5,
                          height: 50,
                          child: MaterialButton(
                            color: Color(0xff00a35a),
                            onPressed: () {
                              setState(() {
                                print('widget reload');
                              });
                            },
                            child: Icon(
                              Icons.replay,
                              size: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //the sliders that allow a color's RGB to be changed
                  GradientColorSliders(
                    gradientBloc: _gradientBloc,
                    snapshot: snapshot,
                  ),

                  // Visual Indicator between Slider and Text Display
                  ExchangeIcon(),

                  // Text Field Showing the color's (acc to its index) the color's text value
                  ColorField(
                      red: snapshot.data[_index.value].red,
                      green: snapshot.data[_index.value].green,
                      blue: snapshot.data[_index.value].blue),
                ]),
              );
            }
          }),
    );
  }
}

// the textfield at the bottom that display the color's hex values
class ColorField extends StatelessWidget {
  ColorField(
      {Key key, @required this.red, @required this.blue, @required this.green})
      : super(key: key);

  final int red;
  final int green;
  final int blue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: TextField(
        autofocus: true,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          prefixText: "#  " +
              red.toRadixString(16) +
              "" +
              green.toRadixString(16) +
              "" +
              blue.toRadixString(16),
          prefixStyle: Theme.of(context).textTheme.bodyText1,
          suffixIcon: IconButton(
            icon: IconTheme(
                data: Theme.of(context).iconTheme,
                child: Icon(Icons.copy_rounded)),
            onPressed: () {
              final snackBar = SnackBar(
                content: Text('Copied Color ' +
                    (_index.value + 1).toString() +
                    ' to Clipboard!'),
                action: SnackBarAction(
                  label: 'DISMISS',
                  onPressed: () {
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  },
                ),
              );
              Clipboard.setData(new ClipboardData(
                  text: 'Red: ' +
                      red.toRadixString(16) +
                      ' Green: ' +
                      green.toRadixString(16) +
                      ' Blue: ' +
                      blue.toRadixString(16)));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ),
        keyboardType: TextInputType.number,
        maxLength: 6,
        readOnly: true,
      ),
    );
  }
}

// the buttons below the gradient display to switch colors and display their respective hex values
class ColorSelectorButtons extends StatefulWidget {
  ColorSelectorButtons({Key key, @required this.index, @required this.colorHex})
      : super(key: key);

  final int index;
  final String colorHex;
  @override
  _ColorSelectorButtonsState createState() => _ColorSelectorButtonsState();
}

class _ColorSelectorButtonsState extends State<ColorSelectorButtons> {
  bool _isPressed = false;

  Color _materialButtonColor() {
    return (Theme.of(context).buttonColor == Colors.white)
        ? (_isPressed && (_index.value == this.widget.index)
            ? Color(0xff252525)
            : Color(0xff303030))
        : (_isPressed && (_index.value == this.widget.index)
            ? Color(0xfff0f0f0)
            : Color(0xfffafafa));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: (MediaQuery.of(context).size.width + 8) / 5,
      child: MaterialButton(
        color: _materialButtonColor(),
        child: Text(
          this.widget.colorHex,
          style: Theme.of(context).textTheme.button,
        ),
        onPressed: () {
          setState(() {
            _index.value = this.widget.index;
            print("_index : " + _index.value.toString());
            GradientColor();
            _isPressed = !_isPressed;
          });
        },
      ),
    );
  }
}

double _redValue = 0;
double _greenValue = 0;
double _blueValue = 0;

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
            gradientBloc: this.widget.gradientBloc,
            snapshot: this.widget.snapshot,
            prefixText: 'R',
            inactiveTrackColor: Colors.red[200],
            activeTrackColor: Colors.red[700],
            thumbColor: Colors.redAccent,
            value: _redValue,
          ),
          RoundedRectangularSliderGradient(
            gradientBloc: this.widget.gradientBloc,
            snapshot: this.widget.snapshot,
            prefixText: 'G',
            inactiveTrackColor: Colors.green[200],
            activeTrackColor: Colors.green[700],
            thumbColor: Colors.greenAccent[700],
            value: _greenValue,
          ),
          RoundedRectangularSliderGradient(
            gradientBloc: this.widget.gradientBloc,
            snapshot: this.widget.snapshot,
            prefixText: 'B',
            inactiveTrackColor: Colors.blue[200],
            activeTrackColor: Colors.blue[700],
            thumbColor: Colors.blueAccent,
            value: _blueValue,
          ),
        ],
      ),
    );
  }
}

// the sliders are custom and this is their definition
class RoundedRectangularSliderGradient extends StatefulWidget {
  const RoundedRectangularSliderGradient(
      {Key key,
      this.gradientBloc,
      this.snapshot,
      this.prefixText,
      this.inactiveTrackColor,
      this.activeTrackColor,
      this.thumbColor,
      this.value})
      : super(key: key);

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
      return this.widget.snapshot.data[_index.value].red.toDouble();
    else if (this.widget.prefixText.toUpperCase() == 'G')
      return this.widget.snapshot.data[_index.value].green.toDouble();
    else if (this.widget.prefixText.toUpperCase() == 'B')
      return this.widget.snapshot.data[_index.value].blue.toDouble();

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
                _redValue = value;
                print("red: " + _redValue.toString());
              }
              if (this.widget.prefixText == 'G') {
                _greenValue = value;
                print("green: " + _greenValue.toString());
              }
              if (this.widget.prefixText == 'B') {
                _blueValue = value;
                print("blue: " + _blueValue.toString());
              }
              this.widget.gradientBloc.getGradientColorChange.add(GradientModel(
                  _index.value,
                  _redValue.toInt(),
                  _greenValue.toInt(),
                  _blueValue.toInt()));
            });
          }),
    );
  }
}
