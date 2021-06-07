import 'package:colorApp/Widgets/exchangeIcon.dart';
import 'package:flutter/material.dart';

import 'package:colorApp/Widgets/colorSaveBoxes.dart';
import 'package:colorApp/Widgets/ColorDisplay.dart';
import 'package:colorApp/Widgets/colorCodeDisplay.dart';
import 'package:colorApp/Widgets/colorSlider.dart';
import 'package:colorApp/Widgets/solidColorTextField.dart';

ValueNotifier<int> red = ValueNotifier<int>(0);
ValueNotifier<int> green = ValueNotifier<int>(0);
ValueNotifier<int> blue = ValueNotifier<int>(0);

//Main SolidColor class, doesn't use BLoC, since it isn't that complicated (as only 1 color is involved), ValueNotifiers do the job fine
class SolidColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;

//ValueListenable listens to green, blue and red values (modified by color sliders) and changes are reflected real-time
//ALso, Bad Code Should be replaced
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
                        backgroundColor: Color(0xff181818),
                        body: SingleChildScrollView(
                          child: Column(children: <Widget>[
                            ColorDisplay(red: red, blue: blue, green: green),
                            SolidColorSliders(),
                            ExchangeIcon(),
                            SolidColorTextField(
                              red: red,
                              blue: blue,
                              green: green,
                            ),
                          ]),
                        ),
                      );
                    });
              });
        });
  }
}
