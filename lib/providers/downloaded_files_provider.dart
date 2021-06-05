import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final downloadedFilesProvider =
    ChangeNotifierProvider((ref) => DownloadsNotifier());

class DownloadsNotifier extends ChangeNotifier {
  final List<String> _value = List.empty(growable: true);
  List<String> get value => _value;

  void addFile(String name) {
    _value.add(name);
    notifyListeners();
  }

  void delete(String name) {
    _value.remove(name);
    notifyListeners();
  }

  void getDownloads(List<String> value) {
    _value.addAll(value);
    notifyListeners();
  }
}
