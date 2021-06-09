import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool _isDarkTheme;

class DarkThemeSwitch extends StatefulWidget {
  const DarkThemeSwitch({Key key}) : super(key: key);

  @override
  _DarkThemeSwitchState createState() => _DarkThemeSwitchState();
}

class _DarkThemeSwitchState extends State<DarkThemeSwitch> {
  @override
  void initState() {
    super.initState();
    _loadInitialDarkThemeValue();
  }

  void _loadInitialDarkThemeValue() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      _isDarkTheme = sharedPreferences.getBool('isDarkTheme') ?? false;
    });
  }

  _setTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('isDarkTheme', _isDarkTheme);
  }

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
          Text('Dark Mode', style: Theme.of(context).textTheme.headline1),
          Spacer(),
          Switch(
            inactiveTrackColor: Color(0xff757575),
            value: _isDarkTheme,
            onChanged: (bool newValue) {
              setState(() {
                _isDarkTheme = !_isDarkTheme;
                print("Chosen theme is dark theme: " + _isDarkTheme.toString());
                _setTheme();
              });
            },
          ),
        ],
      ),
    );
  }
}
