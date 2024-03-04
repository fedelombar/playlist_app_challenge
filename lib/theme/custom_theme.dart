import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    // Here we define colors, fonts, etc.
    return ThemeData(
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'SFProDisplay',
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Colors.grey[900],
      scaffoldBackgroundColor: Colors.black,
      fontFamily: 'SFProDisplay',
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.grey[800],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}

// background color #110417