import 'dart:async';

import 'package:colorApp/Models/GradientModel.dart';

class GradientBloc {
  List<GradientModel> _gradientList = [
    GradientModel(0, 0, 0, 0),
    GradientModel(1, 0, 0, 0),
    GradientModel(2, 0, 0, 0),
    GradientModel(3, 0, 0, 0),
  ];

  final _gradientListStreamController = StreamController<List<GradientModel>>();

  //for changge in the color values of the individual colors
  final _gradientColorRedChangeController = StreamController<GradientModel>();
  final _gradientColorGreenChangeController = StreamController<GradientModel>();
  final _gradientColorBlueChangeController = StreamController<GradientModel>();

  //getters
  Stream<List<GradientModel>> get getGradientStream =>
      _gradientListStreamController.stream;

  StreamSink<List<GradientModel>> get getGradientSink =>
      _gradientListStreamController.sink;
  StreamSink<GradientModel> get getGradientRedColorChange =>
      _gradientColorRedChangeController.sink;
  StreamSink<GradientModel> get getGradientGreenColorChange =>
      _gradientColorGreenChangeController.sink;
  StreamSink<GradientModel> get getGradientBlueColorChange =>
      _gradientColorBlueChangeController.sink;

  //Constructor
  GradientBloc() {
    _gradientColorRedChangeController.stream
        .listen((GradientModel gradientModel) {
      _gradientList[gradientModel.index].red = gradientModel.red;
      _gradientList[gradientModel.index].green = gradientModel.green;
      _gradientList[gradientModel.index].blue = gradientModel.blue;
    });

    _gradientColorGreenChangeController.stream
        .listen((GradientModel gradientModel) {
      _gradientList[gradientModel.index].green = gradientModel.green;
    });

    _gradientColorBlueChangeController.stream
        .listen((GradientModel gradientModel) {
      _gradientList[gradientModel.index].blue = gradientModel.blue;
    });

    getGradientSink.add(_gradientList);
  }

  //CLearing the memory
  void dispose() {
    _gradientListStreamController.close();

    _gradientColorRedChangeController.close();
    _gradientColorGreenChangeController.close();
    _gradientColorBlueChangeController.close();
  }
}
