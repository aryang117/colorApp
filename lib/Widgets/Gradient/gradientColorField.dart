import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:colorApp/Screens/gradient.dart';

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
                    (index.value + 1).toString() +
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
