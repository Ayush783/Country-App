import 'package:country/models/country/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookMarkProvider = ChangeNotifierProvider((ref) => BookMarkNotifier());

class BookMarkNotifier extends ChangeNotifier {
  List<Country> _value = List<Country>.empty(growable: true);
  List<Country> get value => _value;

  void toggleBookmark(Country country) {
    if (_value.contains(country))
      _value.remove(country);
    else
      _value.add(country);
    notifyListeners();
  }
}
