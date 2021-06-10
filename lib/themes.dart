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

  // Text Style for Rounded Rectangular Thumb used in the Sliders
  TextStyle _returnRoundedRectThumbTextStyle() {
    switch (font) {
      case 'Nunito':
        return GoogleFonts.nunito(
            fontSize: 18,
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);
      case 'Lato':
        return GoogleFonts.lato(
            fontSize: 18,
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);
      case 'Poppins':
        return GoogleFonts.poppins(
            fontSize: 18,
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);
      case 'Ubuntu Mono':
        return GoogleFonts.ubuntuMono(
            fontSize: 18,
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);

      default:
        return GoogleFonts.roboto(
            fontSize: 18,
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);
    }
  }

  // Colors for the DropDownButton Color
  Color _dropDownButtonBackgroundColor() {
    return !isDarkTheme
        ? _lightThemeDropDownMenuBackground
        : _darkThemeDropDownMenuBackground;
  }

  // Text Theme for the drop down button
  TextStyle _dropdownButtonTextStyle() {
    switch (font) {
      case 'Nunito':
        return GoogleFonts.nunito(
            fontSize: 18,
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);
      case 'Lato':
        return GoogleFonts.lato(
            fontSize: 18,
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);
      case 'Poppins':
        return GoogleFonts.poppins(
            fontSize: 18,
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);
      case 'Ubuntu Mono':
        return GoogleFonts.ubuntuMono(
            fontSize: 18,
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);

      default:
        return GoogleFonts.roboto(
            fontSize: 18,
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);
    }
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

  // Text Theme for the material button in the gradient color selector buttons text
  TextStyle _returnMaterialButtonTextTheme() {
    switch (font) {
      case 'Nunito':
        return GoogleFonts.nunito(
            fontSize: 14,
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);
      case 'Lato':
        return GoogleFonts.lato(
            fontSize: 14,
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);
      case 'Poppins':
        return GoogleFonts.poppins(
            fontSize: 14,
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);
      case 'Ubuntu Mono':
        return GoogleFonts.ubuntuMono(
            fontSize: 14,
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);

      default:
        return GoogleFonts.roboto(
            fontSize: 14,
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);
    }
  }

// Solid and Gradient Color Text Field (Hex) text styles
  TextStyle _returnColorTextFieldTextStyle() {
    switch (font) {
      case 'Nunito':
        return GoogleFonts.nunito(
            fontSize: 20,
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);
      case 'Lato':
        return GoogleFonts.lato(
            fontSize: 20,
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);
      case 'Poppins':
        return GoogleFonts.poppins(
            fontSize: 20,
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);
      case 'Ubuntu Mono':
        return GoogleFonts.ubuntuMono(
            fontSize: 20,
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);

      default:
        return GoogleFonts.roboto(
            fontSize: 20,
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);
    }
  }

// Settings Options (labels) text styles text styles
  TextStyle _returnSettingsOptionsTextStyle() {
    switch (font) {
      case 'Nunito':
        return GoogleFonts.nunito(
            fontSize: 22,
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);
      case 'Lato':
        return GoogleFonts.lato(
            fontSize: 22,
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);
      case 'Poppins':
        return GoogleFonts.poppins(
            fontSize: 22,
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);
      case 'Ubuntu Mono':
        return GoogleFonts.ubuntuMono(
            fontSize: 22,
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);

      default:
        return GoogleFonts.roboto(
            fontSize: 22,
            color: isDarkTheme ? _darkThemeFontColor : _lightThemeFontColor);
    }
  }
}
