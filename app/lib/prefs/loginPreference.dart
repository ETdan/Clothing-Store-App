import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class defaultt with ChangeNotifier {
  defaultt() {
    _loadingPrefs();
  }
  bool islogin = false;
  SharedPreferences? _prefs;
  _initializePrefs() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
    notifyListeners();
  }

  _loadingPrefs() async {
    await _initializePrefs();
    islogin = await _prefs?.getBool('loggedIn') ?? false;
    notifyListeners();
  }

  _savingPrefs() async {
    await _initializePrefs();
    _prefs!.setBool('loggedIn', islogin);
    notifyListeners();
  }

  void toggle() async {
    islogin = !islogin;
    _savingPrefs();
    notifyListeners();
  }
}
