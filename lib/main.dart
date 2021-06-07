import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/home.dart';

import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getFont(),
        builder: (context, snapshot) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.blueGrey[50],
              textTheme: TextTheme(
                headline1: returnSettingsOptionsTextStyle(snapshot.data),
                bodyText1: returnColorTextFieldTextStyle(snapshot.data),
              ),
            ),
            home: Home(),
          );
        });
  }
}

// Solid and Gradient Color Text Field (Hex) text styles
TextStyle returnColorTextFieldTextStyle(String font) {
  switch (font) {
    case 'Nunito':
      return GoogleFonts.nunito(color: Colors.white, fontSize: 20);
    case 'Lato':
      return GoogleFonts.lato(color: Colors.white, fontSize: 20);
    case 'Poppins':
      return GoogleFonts.poppins(color: Colors.white, fontSize: 20);
    case 'Ubuntu Mono':
      return GoogleFonts.ubuntuMono(color: Colors.white, fontSize: 20);

    default:
      return GoogleFonts.roboto(color: Colors.white, fontSize: 20);
  }
}

// Settings Options (labels) text styles text styles
TextStyle returnSettingsOptionsTextStyle(String font) {
  switch (font) {
    case 'Nunito':
      return GoogleFonts.nunito(fontSize: 22, color: Colors.white);
    case 'Lato':
      return GoogleFonts.lato(fontSize: 22, color: Colors.white);
    case 'Poppins':
      return GoogleFonts.poppins(fontSize: 22, color: Colors.white);
    case 'Ubuntu':
      return GoogleFonts.ubuntuMono(fontSize: 22, color: Colors.white);

    default:
      return GoogleFonts.roboto(fontSize: 22, color: Colors.white);
  }
}

_getFont() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String font = sharedPreferences.getString('font') ?? "Roboto";
  print(font);
  return font;
}

String randomGen() {
  var random = Random.secure();

  int value = random.nextInt(5);

  switch (value) {
    case 1:
      return 'Nunito';
    case 2:
      return 'Lato';
    case 3:
      return 'Poppins';
    case 4:
      return 'Ubuntu Mono';
    default:
      return 'Roboto';
  }
}
