import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/home.dart';

String _fontData;
bool _isDarkTheme;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _isLoadingFirstTime();
    _loadInitialDropDownValue();
    _loadInitialDarkThemeValue();
  }

  void _isLoadingFirstTime() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    if (!sharedPreferences.containsKey('isDarkTheme') &&
        !sharedPreferences.containsKey('font')) {
      sharedPreferences.setString('font', 'Roboto');
      sharedPreferences.setBool('isDarkTheme', true);
    }
  }

  void _loadInitialDropDownValue() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      _fontData = sharedPreferences.getString('font');
    });
  }

  void _loadInitialDarkThemeValue() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      _isDarkTheme = sharedPreferences.getBool('isDarkTheme');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueGrey[50],
        textTheme: TextTheme(
          headline1: returnSettingsOptionsTextStyle(_fontData),
          bodyText1: returnColorTextFieldTextStyle(_fontData),
        ),
      ),
      home: Home(),
    );
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
    case 'Ubuntu Mono':
      return GoogleFonts.ubuntuMono(fontSize: 22, color: Colors.white);

    default:
      return GoogleFonts.roboto(fontSize: 22, color: Colors.white);
  }
}
