import 'package:flutter/material.dart';

import 'package:colorApp/Widgets/Gradient/GradientColorSliders.dart';
import 'package:colorApp/Widgets/Gradient/GradientDisplay.dart';
import 'package:colorApp/Widgets/Gradient/gradientColorField.dart';
import 'package:colorApp/Widgets/Gradient/gradientColorSelectorButtons.dart';
import 'package:colorApp/Widgets/exchangeIcon.dart';

import 'package:colorApp/Models/GradientModel.dart';
import 'package:colorApp/Logic/GradientBloc.dart';

//index for different colors
ValueNotifier<int> index = ValueNotifier(0);

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
                  _gradientColorSelectorRow(snapshot),

                  //the sliders that allow a color's RGB to be changed
                  GradientColorSliders(
                    gradientBloc: _gradientBloc,
                    snapshot: snapshot,
                  ),

                  // Visual Indicator between Slider and Text Display
                  ExchangeIcon(),

                  // Text Field Showing the color's (acc to its index) the color's text value
                  ColorField(
                      red: snapshot.data[index.value].red,
                      green: snapshot.data[index.value].green,
                      blue: snapshot.data[index.value].blue),
                ]),
              );
            }
          }),
    );
  }

  Widget _gradientColorSelectorRow(AsyncSnapshot snapshot) {
    return Container(
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
          _gradientColorReloadButton(),
        ],
      ),
    );
  }

  //Bloc Model doesn't refresh data automatically
  //(the data is a 2D list, but only elements are modified NOT the WHOLE 2D List, so BLoC doesn't refresh it automatically)
  // this setState refreshes the whole widget
  Widget _gradientColorReloadButton() {
    return Container(
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
    );
  }
}

double redValue = 0;
double greenValue = 0;
double blueValue = 0;
