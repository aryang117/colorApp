import 'package:flutter/material.dart';
import 'package:colorApp/Screens/gradient.dart';

// the buttons below the gradient display to switch colors and display their respective hex values
class ColorSelectorButtons extends StatefulWidget {
  ColorSelectorButtons({Key key, @required this.index, @required this.colorHex})
      : super(key: key);

  final int index;
  final String colorHex;
  @override
  _ColorSelectorButtonsState createState() => _ColorSelectorButtonsState();
}

class _ColorSelectorButtonsState extends State<ColorSelectorButtons> {
  bool _isPressed = false;

  Color _materialButtonColor() {
    return (Theme.of(context).buttonColor == Colors.white)
        ? (_isPressed && (index.value == this.widget.index)
            ? Color(0xff252525)
            : Color(0xff303030))
        : (_isPressed && (index.value == this.widget.index)
            ? Color(0xfff0f0f0)
            : Color(0xfffafafa));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: (MediaQuery.of(context).size.width + 8) / 5,
      child: MaterialButton(
        color: _materialButtonColor(),
        child: Text(
          this.widget.colorHex,
          style: Theme.of(context).textTheme.button,
        ),
        onPressed: () {
          setState(() {
            index.value = this.widget.index;
            print("index : " + index.value.toString());
            GradientColor();
            _isPressed = !_isPressed;
          });
        },
      ),
    );
  }
}
