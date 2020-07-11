import 'package:colorApp/Screens/solidColor.dart';
import 'package:flutter/material.dart';

import 'package:colorApp/Widgets/colorSaveBoxes.dart';
import 'package:colorApp/Widgets/colorCodeDisplay.dart';
import 'package:colorApp/Widgets/GradientColorSliders.dart';
import 'package:colorApp/Widgets/GradientDisplay.dart';

import 'package:colorApp/Models/GradientModel.dart';
import 'package:colorApp/Logic/GradientBloc.dart';

class GradientColor extends StatefulWidget {
  @override
  _GradientColorState createState() => _GradientColorState();
}

class _GradientColorState extends State<GradientColor> {
  final GradientBloc _gradientBloc = new GradientBloc();
  double _redValue = 0;
  double _greenValue = 0;
  double _blueValue = 0;
  @override
  // void dispose() {
  //   _gradientBloc.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;

    void _onFABPressed() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              color: Color(0xff212121),
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: ColorSaveBoxesList(i: 4));
        },
      );
    }

    return Scaffold(
      backgroundColor: Color(0xff212121),
      body: StreamBuilder<List<GradientModel>>(
          stream: _gradientBloc.getGradientStream,
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
                  // Container(
                  //   padding:
                  //       new EdgeInsets.fromLTRB(0, screenheight * 0.05, 0, 0),
                  //   // child: ColorCode(
                  //   //   red: red,
                  //   //   green: green,
                  //   //   blue: blue,
                  //   // ),
                  // ),
                  GradientDisplay(
                    color1: snapshot.data[0],
                    color2: snapshot.data[1],
                    color3: snapshot.data[2],
                    color4: snapshot.data[3],
                  ),
                  Text(snapshot.data[0].red.toString() +
                      " " +
                      snapshot.data[0].green.toString() +
                      " " +
                      snapshot.data[0].blue.toString() +
                      " "),
                  Text(snapshot.data[1].red.toString() +
                      " " +
                      snapshot.data[1].green.toString() +
                      " " +
                      snapshot.data[1].blue.toString() +
                      " "),
                  Text(snapshot.data[2].red.toString() +
                      " " +
                      snapshot.data[2].green.toString() +
                      " " +
                      snapshot.data[2].blue.toString() +
                      " "),
                  Text(snapshot.data[3].red.toString() +
                      " " +
                      snapshot.data[3].green.toString() +
                      " " +
                      snapshot.data[3].blue.toString() +
                      " "),
                  GradientColorSliders(
                      gradientBloc: _gradientBloc, snapshot: snapshot),

                  // SliderTheme(
                  //   data: SliderTheme.of(context).copyWith(
                  //     activeTrackColor: Colors.red[700],
                  //     inactiveTrackColor: Colors.red[100],
                  //     trackShape: RectangularSliderTrackShape(),
                  //     trackHeight: 4.0,
                  //     thumbColor: Colors.redAccent,
                  //     thumbShape:
                  //         RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  //     overlayColor: Colors.red.withAlpha(32),
                  //     overlayShape:
                  //         RoundSliderOverlayShape(overlayRadius: 28.0),
                  //   ),
                  //   child: Slider(
                  //       activeColor: Colors.red,
                  //       label: _redValue.toString(),
                  //       value: _redValue,
                  //       divisions: 255,
                  //       min: 0,
                  //       max: 255,
                  //       onChanged: (double value) {
                  //         setState(() {
                  //           _gradientBloc.getGradientRedColorChange.add(
                  //               GradientModel(1, _redValue.toInt(),
                  //                   _greenValue.toInt(), _blueValue.toInt()));
                  //           _redValue = value;
                  //           print(snapshot.data[1].red);
                  //           print(_redValue);
                  //         });
                  //       }),
                  // ),
                  // Slider(
                  //     activeColor: Colors.green,
                  //     label: _greenValue.toString(),
                  //     value: _greenValue,
                  //     min: 0,
                  //     max: 255,
                  //     divisions: 255,
                  //     onChanged: (double value) {
                  //       setState(() {
                  //         _gradientBloc.getGradientGreenColorChange.add(
                  //             GradientModel(1, _redValue.toInt(),
                  //                 _greenValue.toInt(), _blueValue.toInt()));
                  //         _greenValue = value;

                  //         print(_greenValue);
                  //       });
                  //     }),
                  // Slider(
                  //     activeColor: Colors.blue,
                  //     label: _blueValue.toString(),
                  //     value: _blueValue,
                  //     min: 0,
                  //     max: 255,
                  //     divisions: 255,
                  //     onChanged: (double value) {
                  //       setState(() {
                  //         _gradientBloc.getGradientBlueColorChange.add(
                  //             GradientModel(1, _redValue.toInt(),
                  //                 _greenValue.toInt(), _blueValue.toInt()));
                  //         _blueValue = value;
                  //         print(_blueValue);
                  //       });
                  //     }),
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
