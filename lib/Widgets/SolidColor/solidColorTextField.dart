import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/Models/SolidColorMdel.dart';

import 'package:provider/provider.dart';

class SolidColorTextField extends StatelessWidget {
  const SolidColorTextField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SolidColorsModel colorProvider = Provider.of<SolidColorsModel>(context);

    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: TextField(
        autofocus: true,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2)),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          prefixText: colorinHex(colorProvider.getRed, colorProvider.getGreen,
              colorProvider.getBlue),
          prefixStyle: Theme.of(context).textTheme.bodyText1,
          suffixIcon: CopyToClipBoardButton(
            red: colorProvider.getRed,
            green: colorProvider.getGreen,
            blue: colorProvider.getBlue,
          ),
        ),
        keyboardType: TextInputType.number,
        maxLength: 6,
        readOnly: true,
      ),
    );
  }
}

//This icon lets the use copy the color that they just created using the sliders
class CopyToClipBoardButton extends StatefulWidget {
  const CopyToClipBoardButton({Key key, this.red, this.green, this.blue})
      : super(key: key);

  final int red;
  final int green;
  final int blue;

  @override
  _CopyToClipBoardButtonState createState() => _CopyToClipBoardButtonState();
}

class _CopyToClipBoardButtonState extends State<CopyToClipBoardButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: IconTheme(
        data: Theme.of(context).iconTheme,
        child: Icon(
          Icons.copy_rounded,
        ),
      ),
      onPressed: () {
        final snackBar = SnackBar(
          content: Text('Copied Color' + ' to Clipboard!'),
          action: SnackBarAction(
            label: 'DISMISS',
            onPressed: () {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
            },
          ),
        );
        Clipboard.setData(new ClipboardData(
            text: colorinHexClipBoard(widget.red, widget.green, widget.blue)));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}

//returns hex colors in string
String colorinHex(int red, int green, int blue) {
  return "#  " +
      red.toRadixString(16) +
      "" +
      green.toRadixString(16) +
      "" +
      blue.toRadixString(16);
}

//return hex colors in string for the clipboard
String colorinHexClipBoard(int red, int green, int blue) {
  return 'Red: ' +
      red.toRadixString(16) +
      ' Green: ' +
      green.toRadixString(16) +
      ' Blue: ' +
      blue.toRadixString(16);
}
