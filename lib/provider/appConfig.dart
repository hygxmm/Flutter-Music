import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfig with ChangeNotifier {
  //state
  int _themeIndex = 0;
  bool _isLogin = false;

  //getter
  int get themeIndex => _themeIndex;
  bool get isLogin => _isLogin;

  //action
  void setTheme(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _themeIndex = value;
    prefs.setInt('themeIndex', value);
    notifyListeners();
  }

  void getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _themeIndex = prefs.getInt('themeIndex');
    if (_themeIndex == null) {
      _themeIndex = 0;
    } else {
      _themeIndex = _themeIndex;
    }
    notifyListeners();
  }
}
