import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetUserTheme {
  GetUserTheme({@required this.font, @required this.isDarkTheme});

  String font;
  bool isDarkTheme;

  // the only publicly accessible method of this class that returns the theme to be use
  ThemeData getTheme() {
    return _makeTheme(font);
  }

  // it makes the theme but is NOT publicly accessible
  ThemeData _makeTheme(String font) {
    return ThemeData(
        backgroundColor: _returnBackgroundColor(),
        textTheme: TextTheme(
          headline1: _returnSettingsOptionsTextStyle(),
          headline6: _dropdownButtonTextStyle(),
          bodyText1: _returnColorTextFieldTextStyle(),
          bodyText2: _returnRoundedRectThumbTextStyle(),
          button: _returnMaterialButtonTextTheme(),
        ),
        iconTheme: _returnIconTheme(),
        buttonColor: _returnMaterialButtonThemeColor(),
        canvasColor: _dropDownButtonBackgroundColor(),
        bottomNavigationBarTheme: _bottomNavigationBarTheme());
  }

  //Background colors for all the screens (Scaffold)
  Color _returnBackgroundColor() {
    return !isDarkTheme ? Color(0xfff7f7f7) : Color(0xff181818);
  }

  // Bottom Nav Bar Theme
  BottomNavigationBarThemeData _bottomNavigationBarTheme() {
    return BottomNavigationBarThemeData(
      backgroundColor: !isDarkTheme ? Colors.white : Color(0xff282828),
      selectedItemColor: !isDarkTheme ? Colors.blue : Colors.white,
    );
  }

  // Text Style for Rounded Rectangular Thumb used in the Sliders
  TextStyle _returnRoundedRectThumbTextStyle() {
    switch (font) {
      case 'Nunito':
        return GoogleFonts.nunito(
            fontSize: 18, color: isDarkTheme ? Colors.white : Colors.black);
      case 'Lato':
        return GoogleFonts.lato(
            fontSize: 18, color: isDarkTheme ? Colors.white : Colors.black);
      case 'Poppins':
        return GoogleFonts.poppins(
            fontSize: 18, color: isDarkTheme ? Colors.white : Colors.black);
      case 'Ubuntu Mono':
        return GoogleFonts.ubuntuMono(
            fontSize: 18, color: isDarkTheme ? Colors.white : Colors.black);

      default:
        return GoogleFonts.roboto(
            fontSize: 18, color: isDarkTheme ? Colors.white : Colors.black);
    }
  }

  // Colors for the DropDownButton Color
  Color _dropDownButtonBackgroundColor() {
    return !isDarkTheme ? Color(0xffe9e9e9) : Color(0xff212121);
  }

  // Text Theme for the drop down button
  TextStyle _dropdownButtonTextStyle() {
    switch (font) {
      case 'Nunito':
        return GoogleFonts.nunito(
            fontSize: 18, color: isDarkTheme ? Colors.white : Colors.black);
      case 'Lato':
        return GoogleFonts.lato(
            fontSize: 18, color: isDarkTheme ? Colors.white : Colors.black);
      case 'Poppins':
        return GoogleFonts.poppins(
            fontSize: 18, color: isDarkTheme ? Colors.white : Colors.black);
      case 'Ubuntu Mono':
        return GoogleFonts.ubuntuMono(
            fontSize: 18, color: isDarkTheme ? Colors.white : Colors.black);

      default:
        return GoogleFonts.roboto(
            fontSize: 18, color: isDarkTheme ? Colors.white : Colors.black);
    }
  }

  // Theme for the icons
  IconThemeData _returnIconTheme() {
    return IconThemeData(color: isDarkTheme ? Colors.white : Colors.blue);
  }

  // Color for the MaterialButton in the gradient color selector button background
  Color _returnMaterialButtonThemeColor() {
    return isDarkTheme ? Colors.white : Colors.black;
  }

  // Text Theme for the material button in the gradient color selector buttons text
  TextStyle _returnMaterialButtonTextTheme() {
    switch (font) {
      case 'Nunito':
        return GoogleFonts.nunito(
            fontSize: 14, color: isDarkTheme ? Colors.white : Colors.black);
      case 'Lato':
        return GoogleFonts.lato(
            fontSize: 14, color: isDarkTheme ? Colors.white : Colors.black);
      case 'Poppins':
        return GoogleFonts.poppins(
            fontSize: 14, color: isDarkTheme ? Colors.white : Colors.black);
      case 'Ubuntu Mono':
        return GoogleFonts.ubuntuMono(
            fontSize: 14, color: isDarkTheme ? Colors.white : Colors.black);

      default:
        return GoogleFonts.roboto(
            fontSize: 14, color: isDarkTheme ? Colors.white : Colors.black);
    }
  }

// Solid and Gradient Color Text Field (Hex) text styles
  TextStyle _returnColorTextFieldTextStyle() {
    switch (font) {
      case 'Nunito':
        return GoogleFonts.nunito(
            fontSize: 20, color: isDarkTheme ? Colors.white : Colors.black);
      case 'Lato':
        return GoogleFonts.lato(
            fontSize: 20, color: isDarkTheme ? Colors.white : Colors.black);
      case 'Poppins':
        return GoogleFonts.poppins(
            fontSize: 20, color: isDarkTheme ? Colors.white : Colors.black);
      case 'Ubuntu Mono':
        return GoogleFonts.ubuntuMono(
            fontSize: 20, color: isDarkTheme ? Colors.white : Colors.black);

      default:
        return GoogleFonts.roboto(
            fontSize: 20, color: isDarkTheme ? Colors.white : Colors.black);
    }
  }

// Settings Options (labels) text styles text styles
  TextStyle _returnSettingsOptionsTextStyle() {
    switch (font) {
      case 'Nunito':
        return GoogleFonts.nunito(
            fontSize: 22, color: isDarkTheme ? Colors.white : Colors.black);
      case 'Lato':
        return GoogleFonts.lato(
            fontSize: 22, color: isDarkTheme ? Colors.white : Colors.black);
      case 'Poppins':
        return GoogleFonts.poppins(
            fontSize: 22, color: isDarkTheme ? Colors.white : Colors.black);
      case 'Ubuntu Mono':
        return GoogleFonts.ubuntuMono(
            fontSize: 22, color: isDarkTheme ? Colors.white : Colors.black);

      default:
        return GoogleFonts.roboto(
            fontSize: 22, color: isDarkTheme ? Colors.white : Colors.black);
    }
  }
}
