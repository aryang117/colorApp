import 'package:colorApp/Widgets/GradientColorSliders.dart';
import 'package:colorApp/Widgets/GradientDisplay.dart';
import 'package:flutter/material.dart';

import 'package:colorApp/Widgets/colorSaveBoxes.dart';
import 'package:colorApp/Widgets/colorCodeDisplay.dart';

ValueNotifier<Color> _gradientColorListColor1 = ValueNotifier<Color>(
  Color.fromRGBO(125, 250, 0, 1),
);

ValueNotifier<Color> _gradientColorListColor2 = ValueNotifier<Color>(
  Color.fromRGBO(0, 0, 0, 1),
);

ValueNotifier<Color> _gradientColorListColor3 = ValueNotifier<Color>(
  Color.fromRGBO(0, 0, 0, 1),
);

ValueNotifier<Color> _gradientColorListColor4 = ValueNotifier<Color>(
  Color.fromRGBO(0, 0, 0, 1),
);

List _gradientColorList = [
  _gradientColorListColor1,
  _gradientColorListColor2,
  _gradientColorListColor3,
  _gradientColorListColor4
];

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
        valueListenable: _gradientColorListColor1,
        child: null,
        builder: (context, Color _gradientColorListColor1, child) {
          return ValueListenableBuilder(
              valueListenable: _gradientColorListColor2,
              child: null,
              builder: (context, Color _gradientColorListColor2, child) {
                return ValueListenableBuilder(
                    valueListenable: _gradientColorListColor3,
                    child: null,
                    builder: (context, Color _gradientColorListColor3, child) {
                      return ValueListenableBuilder(
                          valueListenable: _gradientColorListColor4,
                          child: null,
                          builder:
                              (context, Color _gradientColorListColor4, child) {
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
                                  GradientColorSliders(
                                      gradientColorList: _gradientColorList),
                                ]),
                              ),
                              floatingActionButtonLocation:
                                  FloatingActionButtonLocation.endFloat,
                              floatingActionButton:
                                  FloatingActionButton.extended(
                                label: Text('+ Save'),
                                onPressed: () => _onFABPressed(),
                                tooltip: 'Add Save Box',
                              ),
                            );
                          });
                    });
              });
        });
  }
}
