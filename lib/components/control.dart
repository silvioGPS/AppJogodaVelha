import 'package:flutter/material.dart';

class Control extends ChangeNotifier {
  static Control instance = Control();

  bool mudaTema = false;

  MudaTema() {
    mudaTema = !mudaTema;
    notifyListeners();
  }
}
