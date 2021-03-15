import 'package:flutter/cupertino.dart';

class Data with ChangeNotifier {
  String _data = "DFgfdgdfgdf";
  String get getData => _data;
  void changeString(String newstr) {
    _data = newstr;
    notifyListeners();
  }
}
