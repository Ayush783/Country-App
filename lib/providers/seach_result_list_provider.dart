import 'package:country/models/country/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchResultListProvider =
    ChangeNotifierProvider((ref) => SearchResultListNotifier());

class SearchResultListNotifier extends ChangeNotifier {
  List<Country> _value = List.empty(growable: true);
  List<Country> get value => _value;

  void getList(List<Country> value) {
    _value = List.from(value);
    notifyListeners();
  }
}
