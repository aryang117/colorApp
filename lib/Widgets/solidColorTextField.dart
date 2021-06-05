import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:colorApp/Screens/solidColor.dart';

class SolidColorTextField extends StatefulWidget {
  const SolidColorTextField(
      {Key key, @required this.red, @required this.blue, @required this.green})
      : super(key: key);

  final int red;
  final int green;
  final int blue;

  @override
  _SolidColorTextFieldState createState() => _SolidColorTextFieldState();
}

class _SolidColorTextFieldState extends State<SolidColorTextField> {
  @override
  Widget build(BuildContext context) {
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
            prefixText: "#  " +
                widget.red.toRadixString(16) +
                "" +
                widget.green.toRadixString(16) +
                "" +
                widget.blue.toRadixString(16),
            prefixStyle: TextStyle(color: Colors.white, fontSize: 20),
            suffixIcon: CopyToClipBoardButton(
              red: red.value,
              green: green.value,
              blue: blue.value,
            )),
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
      icon: Icon(
        Icons.copy_rounded,
        color: Colors.white,
      ),
      onPressed: () {
        final snackBar = SnackBar(
          content: Text('Copied Color ' + ' to Clipboard!'),
          action: SnackBarAction(
            label: 'DISMISS',
            onPressed: () {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
            },
          ),
        );
        Clipboard.setData(new ClipboardData(
            text: 'Red: ' +
                widget.red.toRadixString(16) +
                ' Green: ' +
                widget.green.toRadixString(16) +
                ' Blue: ' +
                widget.blue.toRadixString(16)));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
