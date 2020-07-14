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
  final _gradientColorChangeController = StreamController<GradientModel>();

  //getters
  Stream<List<GradientModel>> get getGradientStream =>
      _gradientListStreamController.stream;

  StreamSink<List<GradientModel>> get getGradientSink =>
      _gradientListStreamController.sink;
  StreamSink<GradientModel> get getGradientColorChange =>
      _gradientColorChangeController.sink;

  //Constructor
  GradientBloc() {
    _gradientColorChangeController.stream.listen((GradientModel gradientModel) {
      _gradientList[gradientModel.index].red = gradientModel.red;
      _gradientList[gradientModel.index].green = gradientModel.green;
      _gradientList[gradientModel.index].blue = gradientModel.blue;
    });

    getGradientSink.add(_gradientList);
  }

  //CLearing the memory
  void dispose() {
    _gradientListStreamController.close();

    _gradientColorChangeController.close();
  }
}
