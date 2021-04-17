import 'package:flutter/material.dart';

import 'package:colorApp/Widgets/colorSaveBoxes.dart';
import 'package:colorApp/Widgets/colorCodeDisplay.dart';
import 'package:colorApp/Widgets/GradientColorSliders.dart';
import 'package:colorApp/Widgets/GradientDisplay.dart';

import 'package:colorApp/Models/GradientModel.dart';
import 'package:colorApp/Logic/GradientBloc.dart';

import 'package:colorApp/Widgets/RoundedRectangularThumb.dart';

TextStyle colorHexStyle = new TextStyle(
  fontSize: 14,
  color: Colors.white,
  fontWeight: FontWeight.w600,
);

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

    //savie floating action button
    void _onFABPressed() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              color: Color(0xff181818),
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: ColorSaveBoxesList(i: 4));
        },
      );
    }

    return Scaffold(
      backgroundColor: Color(0xff181818),

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
                  Row(
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

                      //Bloc Model doesn't refresh data automatically so had to create a refresh button
                      Container(
                        width: 55,
                        height: 50,
                        child: MaterialButton(
                          color: Color(0xff00a35a),
                          onPressed: () {
                            setState(() {
                              Container(height: 50, child: GradientColor());
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

                  //the sliders that allow a color's RGB to be changed
                  GradientColorSliders(
                    gradientBloc: _gradientBloc,
                    snapshot: snapshot,
                    // gradientColor: GradientColor(),
                  ),

                  // Visual Indicator between Slider and Text Display
                  RotatedBox(
                    quarterTurns: 1,
                    child: Icon(
                      Icons.sync_alt,
                      color: Colors.white,
                    ),
                  ),

                  // Text Field Showing the color's (acc to its index) the color's text value
                  ColorField(
                      red: snapshot.data[_index.value].red,
                      green: snapshot.data[_index.value].green,
                      blue: snapshot.data[_index.value].blue),
                ]),
              );
            }
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Text('+ Save'),
        onPressed: () => _onFABPressed(),
        tooltip: 'Add Save Box',
      ),
    );
  }
}

// the textfield at the bottom that display the color's hex values
// BROKEN, COLORTEXTIELD and COLORFIELD
class ColorTextField extends StatefulWidget {
  @override
  _ColorTextFieldState createState() => _ColorTextFieldState();
}

class _ColorTextFieldState extends State<ColorTextField> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//broken, should be replaced with colortextfield
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
      child: TextFormField(
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
          prefixStyle: TextStyle(color: Colors.white, fontSize: 20),
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
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 80,
      //color: Color(0xff252525),
      child: MaterialButton(
        color: _isPressed && (_index.value == this.widget.index)
            ? Color(0xff252525)
            : Color(0xff303030),
        child: Text(
          this.widget.colorHex,
          style: colorHexStyle,
        ),
        onPressed: () {
          setState(() {
            _index.value = this.widget.index;
            print("_index : " + _index.value.toString());
            GradientColor();
            _isPressed = !_isPressed;
            if (!_isPressed) _index.value = 0;
          });
        },
      ),
    );
  }
}

TextStyle formStyle = new TextStyle(
  fontSize: 20,
  color: Colors.white,
);

double _redValue = 0;
double _greenValue = 0;
double _blueValue = 0;

//
class GradientColorSliders extends StatefulWidget {
  GradientColorSliders({
    Key key,
    @required this.gradientBloc,
    @required this.snapshot,
    //@required this.gradientColor,
  }) : super(key: key);

  final GradientBloc gradientBloc;
  final AsyncSnapshot snapshot;
  //final GradientColor gradientColor;

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
            prefixText: this.widget.prefixText),
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
