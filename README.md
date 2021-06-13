# colorApp

An application that lets the you create beautiful solid and gradient colors on-the-fly.

## Features
Using this app you can create -
- Beautiful Solid Colors 
- Amazing Gradients with upto 4 different colors for the same gradient
- Modify and Save Preferences for different fonts and choose you favorite theme (dark and light)

## Preview GIFS and ScreenShots
![SolidColor] (/ssGifs/gradientSS.png)
![Gradient] (https://raw.githubusercontent.com/Trolled00Gamer/colorApp/dev/ssGifs/gradientSS.png?token=AG6STAZ4ZZMYGOGJS6SIZFDAYXTE4)

## Modules
This section talks about the different modules about the app and how I worked on them

 ### Solid Color
 This lets you create Solid Colors.
 As of right now, it uses nested ValueListenableBuilders to create, update and display the RGB (Red, Green and Blue) values of the color. (though I aim to replace a nested ValueListenableBuilders with the BLoC pattern soon).
 
 ### Gradient
 This lets you create Gradient Colors. 
 The Gradient consists of 4 colors (cannot be changed). The 4 colors are saved in a 2D List and the changed are tracked by the Provider pattern (implement as per BLoC architecture).
 
 ### Settings
 This lets you change / set preferences (or choice) for theme (dark / light) and / or Font to be used throught the app.
 The preferences are saved / loaded using the SharedPreferences package and the values are loaded when the app is initially opened (and for the settings page, when the settings module is initialized).
 
 ## Status
 As of right now, the project stands complete. However, I do wish to change the mechanism by which the colors are changed.
 
 ## What did I Learn?
 Whilst working on this project, I have learned quite a few amazing things (on all levels and frontiers (like git, coding, design)). But some of the most notable topics that I came across (in Flutter) are as follows -
 - ValueListenableBuilder
 - Provider
 - SharedPreferences
 - State Management
 - Future (FutureBuilder, Future Functions)
 - Async/Await
 - Dart DevTools
 - Themeing (dark / light theme based on user's perferences)
 - BLoC
 - Custom Widgets (Modifying already existing material widgets - Modified the default slider's thumb from a circular thumb to a Rounded-Rectangular thumb)
 - 3rd Party Dependencies (like Persistent Nav Bar, Google Fonts)
 As I continue to work on this project, I hope I can learn a lot more new things
