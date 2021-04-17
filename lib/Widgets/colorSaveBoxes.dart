import 'package:flutter/material.dart';

//These boxes will (if feasible else removed) be used to save colors,
//present in the FABs on SolidColor and GradientScreen
class ColorSaveBoxesList extends StatelessWidget {
  const ColorSaveBoxesList({Key key, @required this.i}) : super(key: key);

  final int i;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      padding: new EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: GridView.count(
          shrinkWrap: true, //made the grid list work inside column
          crossAxisCount: 4,
          children: List.generate(i, (index) {
            return ColorSaveBoxes();
          })),
    );
  }
}

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
