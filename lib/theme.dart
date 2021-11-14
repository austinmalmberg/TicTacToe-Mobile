import 'package:flutter/material.dart';

final ThemeData sharedTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.green,
  primaryColorDark: Colors.grey[300],
  primaryColorLight: Colors.grey[200],
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
    ),
    centerTitle: true,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all<TextStyle?>(
        const TextStyle(fontSize: 60.0),
      ),
    ),
  ),
  primaryTextTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 30.0,
      color: Colors.black,
    ),
  ),
);

final ThemeData darkTheme = sharedTheme.copyWith(
  brightness: Brightness.dark,
  primaryColorDark: Colors.grey[800],
  primaryColorLight: Colors.grey[700],
);
