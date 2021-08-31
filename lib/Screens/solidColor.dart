import 'package:flutter/material.dart';

import '../Widgets/exchangeIcon.dart';
import '../Widgets/SolidColor/ColorDisplay.dart';
import '../Widgets/SolidColor/colorSlider.dart';
import '../Widgets/SolidColor/solidColorTextField.dart';

import 'package:colorApp/Models/SolidColorMdel.dart';

import 'package:provider/provider.dart';

//now we use Providers
class SolidColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      lazy: true,
      create: (_) => SolidColorsModel(),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            ColorDisplay(),
            SolidColorSliders(),
            ExchangeIcon(),
            SolidColorTextField(),
          ]),
        ),
      ),
    );
  }
}
