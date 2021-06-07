import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle _settingsOptionsTextStyle =
    TextStyle(fontSize: 22, color: Colors.white);
bool _isDarkTheme = true;
String _dropdownValue = 'Roboto';

class Settings extends StatefulWidget {
  const Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
      color: Color(0xff181818),
      child: Column(
        children: [
          DarkThemeSwitch(),
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
          ),
          DropDownFontSwitcher(),
        ],
      ),
    );
  }
}

class DarkThemeSwitch extends StatefulWidget {
  const DarkThemeSwitch({Key key}) : super(key: key);

  @override
  _DarkThemeSwitchState createState() => _DarkThemeSwitchState();
}

class _DarkThemeSwitchState extends State<DarkThemeSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Row(
        children: [
          Icon(
            Icons.nightlight_outlined,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
          ),
          Text(
            'Dark Mode',
            style: _settingsOptionsTextStyle,
          ),
          Spacer(),
          Switch(
            inactiveTrackColor: Color(0xff757575),
            value: _isDarkTheme,
            onChanged: (bool newValue) {
              setState(() {
                _isDarkTheme = !_isDarkTheme;
              });
            },
          ),
        ],
      ),
    );
  }
}

class DropDownFontSwitcher extends StatefulWidget {
  const DropDownFontSwitcher({Key key}) : super(key: key);

  @override
  _DropDownFontSwitcherState createState() => _DropDownFontSwitcherState();
}

class _DropDownFontSwitcherState extends State<DropDownFontSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Row(
        children: [
          Icon(
            Icons.font_download_outlined,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
          ),
          Text(
            'Font',
            style: _settingsOptionsTextStyle,
          ),
          Spacer(),
          Container(
            width: 120,
            decoration: BoxDecoration(
              color: Color(0xff202020),
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
            child: Center(
              child: DropdownButton<String>(
                value: _dropdownValue,
                icon: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: const Icon(
                    Icons.arrow_downward_rounded,
                    color: Colors.blue,
                  ),
                ),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.white, fontSize: 18),
                dropdownColor: Color(0xff212121),
                underline: Container(
                  height: 2,
                  color: Color(0xff212121),
                ),
                onChanged: (String newValue) {
                  setState(() {
                    _dropdownValue = newValue;
                    print(newValue);
                  });
                },
                items: <String>['Nunito', 'Roboto', 'Arial', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
