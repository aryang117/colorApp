import 'package:flutter/material.dart';

import 'package:colorApp/Screens/home.dart';

//TODO: Add Text Labels for the sliders so that user can know what values of RGB they're currently at - done

//TODO: fix the labelTextString so that their cursors aren't at the start but are at the end 

TextStyle formStyle = new TextStyle(fontSize: 20, color: Colors.white);

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
          Sliders(
            labelTextString: 'R',
            sliderValue: red.value,
          ),
          Sliders(
            labelTextString: 'G',
            sliderValue: green.value,
          ),
          Sliders(
            labelTextString: 'B',
            sliderValue: blue.value,
          )
        ],
      ),
    );
  }
}

class Sliders extends StatefulWidget {
  @override
  _SlidersState createState() => _SlidersState();

  const Sliders(
      {Key key, @required this.labelTextString, @required this.sliderValue})
      : super(key: key);
  final String labelTextString;
  final int sliderValue;
}

class _SlidersState extends State<Sliders> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SliderTextLabel(
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

final TextEditingController _controller = TextEditingController(text: '');

class SliderTextLabel extends StatelessWidget {
  const SliderTextLabel(
      {Key key, @required this.labelTextString, @required this.sliderValue})
      : super(key: key);
  final String labelTextString;
  final int sliderValue;
  @override
  Widget build(BuildContext context) {
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
            controller: TextEditingController(
              text: sliderValue.toString(),
            ),
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
