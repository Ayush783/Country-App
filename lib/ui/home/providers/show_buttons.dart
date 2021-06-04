import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final showButtonsProvider =
    ChangeNotifierProvider((ref) => ShowButtonsChangeNotifier());

class ShowButtonsChangeNotifier extends ChangeNotifier {
  bool _value = false;
  bool get value => _value;

  void toggleShow() {
    _value = !_value;
    notifyListeners();
  }
}
