# ColorApp
An application that lets the you create beautiful solid and gradient colors on-the-fly.

## Features
Using this app you can create -
- Beautiful Solid Colors 
- Amazing Gradients with upto 4 different colors for the same gradient
- Modify and Save Preferences for different fonts and choose you favorite theme (dark and light)

## Building the Project
To build this project, please make sure that you have flutter installed and once you're ready, navigate to the Project root directory and run ``flutter run`` command in your terminal or, you can use your preferred Editor for the same as well.

## Preview GIFS and ScreenShots
<div>
<img src="/ssGifs/solidColorSS.png" alt="solidColor" width="25%" height="25%"/>
 
<img src="/ssGifs/gradientSS.png" alt="Gradient" width="25%" height="25%"/>
 
<img src="/ssGifs/SettingsGif.gif" alt="Settings" width="25%" height="25%"/>
</div>

## Modules

 ### Solid Color
 This lets you create Solid Colors.
 It uses ValueListenableBuilder to create, update and display the RGB (Red, Green and Blue) values of the color.
 
 ### Gradient
 This lets you create Gradient Colors. 
 The Gradient consists of 4 colors (cannot be changed). The 4 colors are saved in a 2D List and the changed are tracked by the Provider pattern (implemented as per BLoC architecture).
 
 ### Settings
 This lets you change / set preferences (or choice) for theme (dark / light) and / or font to be used throught the app.
 The values are loaded when the app is initially opened (and for the settings page, when the settings module is initialized).
 This all is done using the SharedPreferences package.
 
## What did I Learn?
 Whilst working on this project, I have learned quite a few amazing things (on all levels and frontiers (like git, coding, design)). But some of the most notable topics that I came across (in Flutter) are as follows -
 - ValueListenableBuilder.
 - Provider.
 - SharedPreferences.
 - State Management.
 - Future (FutureBuilder, Future Functions).
 - Async/Await.
 - Dart DevTools.
 - Themeing (dark / light theme based on user's perferences).
 - BLoC.
 - Custom Widgets (Modifying already existing material widgets - Modified the default slider's thumb from a circular thumb to a Rounded-Rectangular thumb).
 - 3rd Party Dependencies (like Persistent Nav Bar, Google Fonts).

 As I continue to work on this project, I will keep learning new things.
