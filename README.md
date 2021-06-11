# colorApp

An application that lets the you create beautiful solid and gradient colors on-the-fly.

## Features
Using this app you can create -
- Beautiful Solid Colors 
- Amazing Gradients with upto 4 different colors for the same gradient
- Modify and Save Preferences for different fonts and choose you favorite theme (dark and light)

## Preview GIFS

## Modules
This section talks about the different modules about the app and how I worked on them

 ### Solid Color
 This lets you create Solid Colors.
 As of right now, it uses nested ValueListenableBuilders to create, update and display the RGB (Red, Green and Blue) values of the color. (though I aim to replace a nested ValueListenableBuilders with the BLoC pattern soon).
 
 ### Gradient
 This lets you create Gradient Colors. 
 The Gradient consists of 4 colors (cannot be changed). The 4 colors are saved in a 2D List and the changed are tracked by the Provider pattern (implement as per BLoC architecture).
 
 ### Settings
 This lets you change / set preferences for theme (dark / light) and / or Font to be used throught the app.
 The preferences are saved / loaded using the SharedPreferences package and the values are loaded when the app is initially opened (and for the settings page, when the settings module is initialized).
 

## Tools and Technologies used
 I used a bunch of different tools and techonologies throughout it's development time (which is still ongoing).
 
 ### Design (UX/UI)
  - #### Figma [Link to previews]
    I used Figma to create prototypes. It helped me not only to preview (and therefore have an idea of how I want the final app to look like) but also iterate and make changes without having to code and hot-reload over and over again.
    
 ### Code Editors    
   - #### Visual Studio Code
   - #### Android Studio
 
 ### Emulator
   - The default Android Emulator
  
  
    
 
 

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
