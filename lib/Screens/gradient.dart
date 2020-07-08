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
  @override
  final GradientBloc _gradientBloc = new GradientBloc();

  void dispose() {
    _gradientBloc.dispose();
    super.dispose();
  }

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
          builder: (context, AsyncSnapshot<List<GradientModel>> snapshot) {
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
                  gradientColorList: snapshot.data,
                ),
                GradientColorSliders(
                    gradientColorList: snapshot.data,
                    gradientBloc: _gradientBloc,
                    snapshot: snapshot),
              ]),
            );
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
