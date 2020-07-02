import 'package:colorApp/Widgets/GradientColorSliders.dart';
import 'package:colorApp/Widgets/GradientDisplay.dart';
import 'package:flutter/material.dart';

import 'package:colorApp/Widgets/colorSaveBoxes.dart';
import 'package:colorApp/Widgets/colorCodeDisplay.dart';

ValueNotifier<List> _gradientColorList = ValueNotifier<List>([
  Color.fromRGBO(0, 0, 0, 1),
  Color.fromRGBO(0, 0, 0, 1),
  Color.fromRGBO(0, 0, 0, 1),
  Color.fromRGBO(0, 0, 0, 1)
]);

class GradientColor extends StatelessWidget {
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

    return ValueListenableBuilder(
        valueListenable: _gradientColorList,
        child: null,
        builder: (context, List _gradientColorList, child) {
          return Scaffold(
            backgroundColor: Color(0xff212121),
            body: SingleChildScrollView(
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
                  gradientColorList: _gradientColorList,
                ),
                GradientColorSliders(gradientColorList: _gradientColorList),
              ]),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: FloatingActionButton.extended(
              label: Text('+ Save'),
              onPressed: () => _onFABPressed(),
              tooltip: 'Add Save Box',
            ),
          );
        });
  }
}
