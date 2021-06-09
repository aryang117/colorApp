import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool _isDarkTheme;

// this switch let's users switch between dark and light theme; changes reflects on reopening the app
class DarkThemeSwitch extends StatefulWidget {
  const DarkThemeSwitch({Key key}) : super(key: key);

  @override
  _DarkThemeSwitchState createState() => _DarkThemeSwitchState();
}

class _DarkThemeSwitchState extends State<DarkThemeSwitch> {
  @override
  void initState() {
    super.initState();

    // loads the value of the theme (light / dark) whenever this widget is built
    _loadInitialDarkThemeValue();
  }

  // loads the value of the theme of user's choice
  void _loadInitialDarkThemeValue() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      _isDarkTheme = sharedPreferences.getBool('isDarkTheme') ?? false;
    });
  }

  // this saves the value of user's choice of theme
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
          IconTheme(
            data: Theme.of(context).iconTheme,
            child: Icon(
              Icons.nightlight_outlined,
            ),
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
