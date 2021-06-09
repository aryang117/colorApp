import 'package:colorApp/Screens/gradient.dart';
import 'package:colorApp/Screens/settings.dart';
import 'package:colorApp/Screens/solidColor.dart';
import 'package:flutter/material.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

//home class, contains bottom nav bar (whose Ist item is the screen displayed by default)
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int i = 0;
  int abc = 0xffffffff;

  PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      SolidColor(),
      GradientColor(),
      Settings(),
    ];
  }

  //items of the nav bar, the first item is the home screen
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.check_box_outline_blank),
        title: ("Solid"),
        activeColor:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.gradient),
        title: ("Gradient"),
        activeColor:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Settings"),
        activeColor:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        inactiveColor: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    //bottom nav bar class
    return PersistentTabView(
        controller: _controller,
        screens: _buildScreens(),
        items:
            _navBarsItems(), // Redundant here but defined to demonstrate for other than custom style
        confineInSafeArea: true,
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        handleAndroidBackButtonPress: true,
        onItemSelected: (int) {
          setState(
              () {}); // This is required to update the nav bar if Android back button is pressed
        },
        navBarStyle:
            NavBarStyle.style12 // Choose the nav bar style with this property
        );
  }
}
