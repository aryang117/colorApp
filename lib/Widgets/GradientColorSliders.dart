import 'package:flutter/material.dart';

import 'package:colorApp/Logic/GradientBloc.dart';
import 'package:colorApp/Models/GradientModel.dart';

TextStyle formStyle = new TextStyle(
  fontSize: 20,
  color: Colors.white,
);

int _index = 0;

double _redValue = 0;
double _greenValue = 0;
double _blueValue = 0;

class GradientColorSliders extends StatefulWidget {
  GradientColorSliders(
      {Key key, @required this.gradientBloc, @required this.snapshot})
      : super(key: key);

  final GradientBloc gradientBloc;
  final AsyncSnapshot snapshot;

  @override
  _GradientColorSlidersState createState() => _GradientColorSlidersState();
}

class _GradientColorSlidersState extends State<GradientColorSliders> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff212121),
      child: Column(children: <Widget>[
        DropdownButton(
          items: <int>[1, 2, 3, 4].map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text(value.toString()),
            );
          }).toList(),
          // value: _index,
          onChanged: (newValue) {
            setState(() {
              _index = newValue - 1;

              print('Value = ' + newValue.toString());
              print('Color' +
                  newValue.toString() +
                  "=" +
                  _redValue.toString() +
                  _greenValue.toString() +
                  _blueValue.toString());
            });
          },
        ),
        GradientSliders(
          gradientBloc: this.widget.gradientBloc,
          snapshot: this.widget.snapshot,
        ),
      ]),
    );
  }
}

class GradientSliders extends StatefulWidget {
  GradientSliders(
      {Key key, @required this.gradientBloc, @required this.snapshot})
      : super(key: key);
  final GradientBloc gradientBloc;
  final AsyncSnapshot snapshot;
  @override
  _GradientSlidersState createState() => _GradientSlidersState();
}

class _GradientSlidersState extends State<GradientSliders> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        children: <Widget>[
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.red[700],
              inactiveTrackColor: Colors.red[100],
              trackShape: RectangularSliderTrackShape(),
              trackHeight: 4.0,
              thumbColor: Colors.redAccent,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
              overlayColor: Colors.red.withAlpha(32),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
            ),
            child: Slider(
                activeColor: Colors.red,
                label: _redValue.toString(),
                value: _redValue,
                divisions: 255,
                min: 0,
                max: 255,
                onChanged: (double value) {
                  setState(() {
                    this.widget.gradientBloc.getGradientRedColorChange.add(
                        GradientModel(_index, _redValue.toInt(),
                            _greenValue.toInt(), _blueValue.toInt()));
                    _redValue = value;
                    print(this.widget.snapshot.data[1].red);
                    print(_redValue);
                  });
                }),
          ),
          Slider(
              activeColor: Colors.green,
              label: _greenValue.toString(),
              value: _greenValue,
              min: 0,
              max: 255,
              divisions: 255,
              onChanged: (double value) {
                setState(() {
                  this.widget.gradientBloc.getGradientGreenColorChange.add(
                      GradientModel(_index, _redValue.toInt(),
                          _greenValue.toInt(), _blueValue.toInt()));
                  _greenValue = value;

                  print(_greenValue);
                });
              }),
          Slider(
              activeColor: Colors.blue,
              label: _blueValue.toString(),
              value: _blueValue,
              min: 0,
              max: 255,
              divisions: 255,
              onChanged: (double value) {
                setState(() {
                  this.widget.gradientBloc.getGradientBlueColorChange.add(
                      GradientModel(_index, _redValue.toInt(),
                          _greenValue.toInt(), _blueValue.toInt()));
                  _blueValue = value;
                  print(_blueValue);
                });
              }),
        ],
      ),
    );
  }
}

// class _Sliders extends StatefulWidget {
//   @override
//   __SlidersState createState() => __SlidersState();

//   const _Sliders(
//       {Key key,
//       @required this.labelTextString,
//       @required this.gradientBloc,
//       @required this.snapshot})
//       : super(key: key);
//   final String labelTextString;
//   final GradientBloc gradientBloc;
//   final AsyncSnapshot snapshot;
// }

// class __SlidersState extends State<_Sliders> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         // _SliderTextLabel(
//         //     labelTextString: widget.labelTextString,
//         //     gradientBloc: widget.gradientBloc),
//         Expanded(
//           child: Slider(
//             activeColor: Colors.red,
//             label: _redValue.toString(),
//             value: _redValue.toDouble(),
//             divisions: 255,
//             min: 0,
//             max: 255,
//             onChanged: (double _newValue) {
//               setState(() {
//                 print(_newValue.toInt());
//                 if (widget.labelTextString == 'R')
//                   _redValue = _newValue.toInt();
//                 else if (widget.labelTextString == 'G')
//                   _greenValue = _newValue.toInt();
//                 else if (widget.labelTextString == 'B')
//                   _blueValue = _newValue.toInt();
//                 this.widget.gradientBloc.getGradientRedColorChange.add(
//                     GradientModel(_index, _redValue.toInt(),
//                         _greenValue.toInt(), _blueValue.toInt()));
//                 print(this.widget.snapshot.data[1].red);
//                 print(_redValue);
//               });
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _SliderTextLabel extends StatelessWidget {
//   const _SliderTextLabel(
//       {Key key, @required this.labelTextString, @required this.gradientBloc})
//       : super(key: key);
//   final String labelTextString;
//   final int gradientBloc;
//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController _controller = TextEditingController(
//       text: gradientBloc.toString(),
//     );
//     _controller.value = _controller.value.copyWith(
//         text: gradientBloc.toString(),
//         selection:
//             TextSelection.collapsed(offset: gradientBloc.toString().length));
//     return Row(
//       children: [
//         Container(
//           padding: new EdgeInsets.only(right: 5),
//           child: Text(
//             labelTextString + ':',
//             style: formStyle,
//           ),
//         ),
//         Container(
//           alignment: Alignment.center,
//           width: 35,
//           height: 40,
//           child: TextField(
//             textAlignVertical: TextAlignVertical.center,
//             style: formStyle,
//             keyboardType: TextInputType.number,
//             controller: _controller,
//             decoration: InputDecoration.collapsed(
//               hintText: '',
//               hintStyle: formStyle,
//               border: UnderlineInputBorder(),
//             ),
//             onChanged: (formValue) {
//               if (int.parse(formValue) > 255) formValue = "255";
//               if (labelTextString == 'R')
//                 _red.value = int.parse(formValue);
//               else if (labelTextString == 'G')
//                 _green.value = int.parse(formValue);
//               else if (labelTextString == 'B')
//                 _blue.value = int.parse(formValue);
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
