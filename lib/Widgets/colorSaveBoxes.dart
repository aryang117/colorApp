import 'package:flutter/material.dart';


//These boxes are where the user can save on top of / load from their previously save colors
class ColorSaveBoxes extends StatelessWidget {
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