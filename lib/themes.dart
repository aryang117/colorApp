import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// vairables for each theme's colors
const Color _darkThemeBackground = Color(0xff181818);
const Color _lightThemeBackground = Color(0xfff7f7f7);
const Color _darkBottomNavBarTheme = Color(0xff282828);
const Color _lightBottomNavBarTheme = Colors.white;
const Color _darkBottomNavBarActiveIcon = Colors.white;
const Color _lightBottomNavBarActiveIcon = Colors.blue;
const Color _darkThemeFontColor = Colors.white;
const Color _lightThemeFontColor = Colors.black;
const Color _darkThemeDropDownMenuBackground = Color(0xff212121);
const Color _lightThemeDropDownMenuBackground = Color(0xffe9e9e9);
const Color _darkThemeIconTheme = Colors.white;
const Color _lightThemeIconTheme = Colors.blue;
const Color _darkThemeMaterialButtonTextColor = Colors.white;
const Color _lightThemeMaterialButtonTextColor = Colors.black;

// variables for each font size
const int _roundedRectThumbFontSize = 18;
const int _materialButtonFontSize = 14;
const int _settingsOptionsFontSize = 22;
const int _dropDownButtonFontSize = 18;
const int _colorTextFieldFontSize = 20;

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
          // Settings Options (labels) text styles text styles
          headline1: _fontMaker(_settingsOptionsFontSize),

          // Text Theme for the drop down button
          headline6: _fontMaker(_dropDownButtonFontSize),

          // Solid and Gradient Color Text Field (Hex) text styles
          bodyText1: _fontMaker(_colorTextFieldFontSize),

          // Text Style for Rounded Rectangular Thumb used in the Sliders
          bodyText2: _fontMaker(_roundedRectThumbFontSize),

          // Text Theme for the material button in the gradient color selector buttons text
          button: _fontMaker(_materialButtonFontSize),
        ),
        iconTheme: _returnIconTheme(),
        buttonColor: _returnMaterialButtonThemeColor(),
        canvasColor: _dropDownButtonBackgroundColor(),
        bottomNavigationBarTheme: _bottomNavigationBarTheme());
  }

  // Background colors for all the screens (Scaffold)
  Color _returnBackgroundColor() {
    return !isDarkTheme ? _lightThemeBackground : _darkThemeBackground;
  }

  // Bottom Nav Bar Theme
  BottomNavigationBarThemeData _bottomNavigationBarTheme() {
    return BottomNavigationBarThemeData(
      backgroundColor:
          !isDarkTheme ? _lightBottomNavBarTheme : _darkBottomNavBarTheme,
      selectedItemColor: !isDarkTheme
          ? _lightBottomNavBarActiveIcon
          : _darkBottomNavBarActiveIcon,
    );
  }

  // return textStyle for different textthemes
  TextStyle _fontMaker(int _fontSize) {
    switch (font) {
      case 'Nunito':
        return GoogleFonts.nunito(
            fontSize: _fontSize.toDouble(),
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);
      case 'Lato':
        return GoogleFonts.lato(
            fontSize: _fontSize.toDouble(),
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);
      case 'Poppins':
        return GoogleFonts.poppins(
            fontSize: _fontSize.toDouble(),
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);
      case 'Ubuntu Mono':
        return GoogleFonts.ubuntuMono(
            fontSize: _fontSize.toDouble(),
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);

      default:
        return GoogleFonts.roboto(
            fontSize: _fontSize.toDouble(),
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);
    }
  }

  // Colors for the DropDownButton Color
  Color _dropDownButtonBackgroundColor() {
    return !isDarkTheme
        ? _lightThemeDropDownMenuBackground
        : _darkThemeDropDownMenuBackground;
  }

  // Theme for the icons
  IconThemeData _returnIconTheme() {
    return IconThemeData(
        color: isDarkTheme ? _darkThemeIconTheme : _lightThemeIconTheme);
  }

  // Color for the MaterialButton in the gradient color selector button background
  Color _returnMaterialButtonThemeColor() {
    return isDarkTheme
        ? _darkThemeMaterialButtonTextColor
        : _lightThemeMaterialButtonTextColor;
  }
}
