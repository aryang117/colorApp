import 'package:colorApp/Widgets/GradientDisplay.dart';
import 'package:flutter/material.dart';

import 'package:colorApp/Widgets/colorSaveBoxes.dart';
import 'package:colorApp/Widgets/colorCodeDisplay.dart';
import 'package:colorApp/Widgets/colorSlider.dart';

ValueNotifier<int> red = ValueNotifier<int>(0);
ValueNotifier<int> green = ValueNotifier<int>(0);
ValueNotifier<int> blue = ValueNotifier<int>(0);

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
        valueListenable: green,
        child: null,
        builder: (context, int green, child) {
          return ValueListenableBuilder(
              valueListenable: blue,
              child: null,
              builder: (context, int blue, child) {
                return ValueListenableBuilder(
                    valueListenable: red,
                    child: null,
                    builder: (context, int red, child) {
                      return Scaffold(
                        backgroundColor: Color(0xff212121),
                        body: SingleChildScrollView(
                          child: Column(children: <Widget>[
                            Container(
                              padding: new EdgeInsets.fromLTRB(
                                  0, screenheight * 0.05, 0, 0),
                              child: ColorCode(
                                red: red,
                                green: green,
                                blue: blue,
                              ),
                            ),
                            GradientDisplay(),
                            ColorSliders(),
                          ]),
                        ),
                        floatingActionButtonLocation:
                            FloatingActionButtonLocation.endFloat,
                        floatingActionButton: FloatingActionButton.extended(
                          label: Text('+ Save'),
                          onPressed: () => _onFABPressed(),
                          tooltip: 'Add Save Box',
                        ),
                      );
                    });
              });
        });
  }
}
