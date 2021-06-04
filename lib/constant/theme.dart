import 'package:flutter/material.dart';

ThemeData? kAppTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'mate',
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
      Color(0xff6C63FF),
    ),
    padding: MaterialStateProperty.all<EdgeInsets>(
      EdgeInsets.symmetric(vertical: 16, horizontal: 48),
    ),
    shape: MaterialStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
    ),
  )),
);
