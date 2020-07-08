import 'package:colorApp/Logic/GradientBloc.dart';
import 'package:flutter/material.dart';

TextStyle formStyle = new TextStyle(
  fontSize: 20,
  color: Colors.white,
);

ValueNotifier<int> _red = ValueNotifier<int>(0);
ValueNotifier<int> _green = ValueNotifier<int>(0);
ValueNotifier<int> _blue = ValueNotifier<int>(0);

ValueNotifier<List> _gradientColorList = ValueNotifier<List>([
  Color.fromRGBO(0, 0, 0, 1),
  Color.fromRGBO(0, 0, 0, 1),
  Color.fromRGBO(0, 0, 0, 1),
  Color.fromRGBO(0, 0, 0, 1)
]);

class GradientColorSliders extends StatefulWidget {
  GradientColorSliders(
      {Key key,
      @required this.gradientColorList,
      @required this.gradientBloc,
      @required this.snapshot})
      : super(key: key);
  final List gradientColorList;
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
          onChanged: (newValue) {
            setState(() {
              this
                  .widget
                  .gradientBloc
                  .getGradientColorChange
                  .add(this.widget.snapshot.data[newValue]);
              // _gradientColorList.value[newValue] =
              //     Color.fromRGBO(_red, _green, _blue, 1);
              print('Value = ' + newValue.toString());
              print('Color' +
                  newValue.toString() +
                  "=" +
                  _red.toString() +
                  _green.toString() +
                  _blue.toString());
            });
          },
        ),
        GradientSliders(),
      ]),
    );
  }
}

class GradientSliders extends StatefulWidget {
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
          _Sliders(
            labelTextString: 'R',
            sliderValue: _red.value,
          ),
          _Sliders(
            labelTextString: 'G',
            sliderValue: _green.value,
          ),
          _Sliders(
            labelTextString: 'B',
            sliderValue: _blue.value,
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
            onChanged: (double _newValue) {
              setState(() {
                print(_newValue.toInt());
                if (widget.labelTextString == 'R')
                  _red.value = _newValue.toInt();
                else if (widget.labelTextString == 'G')
                  _green.value = _newValue.toInt();
                else if (widget.labelTextString == 'B')
                  _blue.value = _newValue.toInt();
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
                _red.value = int.parse(formValue);
              else if (labelTextString == 'G')
                _green.value = int.parse(formValue);
              else if (labelTextString == 'B')
                _blue.value = int.parse(formValue);
            },
          ),
        ),
      ],
    );
  }
}
