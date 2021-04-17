import 'package:flutter/material.dart';

import 'package:colorApp/Screens/solidColor.dart';

TextStyle formStyle = new TextStyle(
  fontSize: 20,
  color: Colors.white,
);

//FOR SOLID COLOR
//These are the sliders that allow the user to change colors
class ColorSliders extends StatefulWidget {
  @override
  _ColorSlidersState createState() => _ColorSlidersState();
}

class _ColorSlidersState extends State<ColorSliders> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        children: <Widget>[
          _Sliders(
            labelTextString: 'R',
            sliderValue: red.value,
          ),
          _Sliders(
            labelTextString: 'G',
            sliderValue: green.value,
          ),
          _Sliders(
            labelTextString: 'B',
            sliderValue: blue.value,
          )
        ],
      ),
    );
  }
}

class _Sliders extends StatefulWidget {
  @override
  __SlidersState createState() => __SlidersState();

  const _Sliders(
      {Key key, @required this.labelTextString, @required this.sliderValue})
      : super(key: key);
  final String labelTextString;
  final int sliderValue;
}

class __SlidersState extends State<_Sliders> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _SliderTextLabel(
            labelTextString: widget.labelTextString,
            sliderValue: widget.sliderValue),
        Expanded(
          child: Slider(
            label: widget.sliderValue.toString(),
            value: widget.sliderValue.toDouble(),
            min: 0,
            max: 255,
            divisions: 255,
            onChanged: (double _newvalue) {
              setState(() {
                print(_newvalue.toInt());
                if (widget.labelTextString == 'R')
                  red.value = _newvalue.toInt();
                else if (widget.labelTextString == 'G')
                  green.value = _newvalue.toInt();
                else if (widget.labelTextString == 'B')
                  blue.value = _newvalue.toInt();
              });
            },
          ),
        ),
      ],
    );
  }
}

class _SliderTextLabel extends StatelessWidget {
  const _SliderTextLabel(
      {Key key, @required this.labelTextString, @required this.sliderValue})
      : super(key: key);
  final String labelTextString;
  final int sliderValue;
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController(
      text: sliderValue.toString(),
    );
    _controller.value = _controller.value.copyWith(
        text: sliderValue.toString(),
        selection:
            TextSelection.collapsed(offset: sliderValue.toString().length));
    return Row(
      children: [
        Container(
          padding: new EdgeInsets.only(right: 5),
          child: Text(
            labelTextString + ':',
            style: formStyle,
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 35,
          height: 40,
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            style: formStyle,
            keyboardType: TextInputType.number,
            controller: _controller,
            decoration: InputDecoration.collapsed(
              hintText: '',
              hintStyle: formStyle,
              border: UnderlineInputBorder(),
            ),
            onChanged: (formValue) {
              if (int.parse(formValue) > 255) formValue = "255";
              if (labelTextString == 'R')
                red.value = int.parse(formValue);
              else if (labelTextString == 'G')
                green.value = int.parse(formValue);
              else if (labelTextString == 'B')
                blue.value = int.parse(formValue);
            },
          ),
        ),
      ],
    );
  }
}
