import 'package:flutter/foundation.dart';

class SolidColorsModel with ChangeNotifier {
  int red = 0;
  int blue = 0;
  int green = 0;

  int get getRed => red;
  int get getBlue => blue;
  int get getGreen => green;

  void updateRed(int newRed) {
    red = newRed;
    notifyListeners();
  }

  void updateGreen(int newGreen) {
    green = newGreen;
    notifyListeners();
  }

  void updateBlue(int newBlue) {
    blue = newBlue;
    notifyListeners();
  }
}
