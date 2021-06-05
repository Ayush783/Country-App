//@dart=2.9
import 'package:country/constant/theme.dart';
import 'package:country/repository/save/shared_pref_service.dart';
import 'package:country/ui/home/home_screen.dart';
import 'package:flutter/material.dart';

class CountryApp extends StatefulWidget {
  const CountryApp({Key key}) : super(key: key);

  @override
  _CountryAppState createState() => _CountryAppState();
}

class _CountryAppState extends State<CountryApp> {
  final SharedPrefService spService = SharedPrefService();

  @override
  void initState() {
    super.initState();
    spService.getBookmarks(context);
    spService.getDownloads(context);
  }

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
