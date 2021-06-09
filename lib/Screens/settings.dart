import 'package:colorApp/Widgets/Settings/settingsDarkThemeSwitch.dart';
import 'package:colorApp/Widgets/Settings/settingsDropDownFontSwitcher.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
        child: Column(
          children: [
            DarkThemeSwitch(),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
            ),
            DropDownFontSwitcher(),
          ],
        ),
      ),
    );
  }
}
