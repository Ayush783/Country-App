//@dart=2.9
import 'package:country/constant/theme.dart';
import 'package:country/ui/home/home_screen.dart';
import 'package:flutter/material.dart';

class CountryApp extends StatelessWidget {
  const CountryApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country app',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: kAppTheme,
    );
  }
}
