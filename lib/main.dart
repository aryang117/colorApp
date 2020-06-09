import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueGrey[50],
      ),
      home: MyHomePage(),
    );
  }
}

ValueNotifier<int> red = ValueNotifier<int>(0);
ValueNotifier<int> green = ValueNotifier<int>(0);
ValueNotifier<int> blue = ValueNotifier<int>(0);

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int i = 0;
  int abc = 0xff212121;

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    int somenumber() {
      i++;
      if (i > 7) i = 7;
      return i;
    }

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
                        backgroundColor: Color(abc),
                        body: Column(children: <Widget>[
                          Container(
                            padding: new EdgeInsets.fromLTRB(
                                0, screenheight * 0.05, 0, 0),
                            child: Text(
                              "Color",
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .fontSize),
                            ),
                          ),
                          Padding(
                            padding: new EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                color: Color.fromRGBO(
                                    red, green, blue, 1),
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      height: 0.66 * screenheight,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                    ColorSliders(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 50,
                            padding: new EdgeInsets.fromLTRB(0, 20, 0, 20),
                            child: GridView.count(
                                shrinkWrap:
                                    true, //made the grid list work inside column
                                crossAxisCount: 4,
                                children: List.generate(i, (index) {
                                  return ColorBox();
                                })),
                          ),
                        ]),
                        floatingActionButton: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              somenumber();
                            });
                          },
                          tooltip: 'Increment',
                          child: Icon(Icons.add),
                        ),
                      );
                    });
              });
        });
  }
}

class ColorBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      color: Color(0xffffffffF),
      child: Container(
        height: 50,
        width: 50,
      ),
    );
  }
}

class ColorSliders extends StatefulWidget {
  @override
  _ColorSlidersState createState() => _ColorSlidersState();
}

class _ColorSlidersState extends State<ColorSliders> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Column(
        children: <Widget>[
          Slider(
            label: red.value.toString(),
            value: red.value.toDouble(),
            min: 0,
            max: 255,
            divisions: 255,
            onChanged: (double _newvalue) {
              setState(() {
                print(_newvalue.toInt());
                red.value = _newvalue.toInt();
              });
            },
          ),
          Slider(
            label: green.value.toString(),
            value: green.value.toDouble(),
            min: 0,
            max: 255,
            divisions: 255,
            onChanged: (double _newvalue) {
              setState(() {
                print(_newvalue.toInt());
                green.value = _newvalue.toInt();
              });
            },
          ),
          Slider(
            label: blue.value.toString(),
            value: blue.value.toDouble(),
            min: 0,
            max: 255,
            divisions: 255,
            onChanged: (double _newvalue) {
              setState(() {
                print(_newvalue.toInt());
                blue.value = _newvalue.toInt();
              });
            },
          ),
        ],
      ),
    );
  }
}
