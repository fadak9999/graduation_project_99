import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModeProvider with ChangeNotifier {
  bool _lightModeEnable = true;

  bool get lightModeEnable => _lightModeEnable;

  set lightModeEnable(bool value) {
    _lightModeEnable = value;
    _saveToPrefs();
    notifyListeners();  // Ensure the listeners are notified of changes
  }

  ModeProvider() {
    _loadFromPrefs();
  }

  // تغيير الوضع بين الإضاءة والظلام
  void chaneMode() {
    _lightModeEnable = !_lightModeEnable;
    _saveToPrefs();
    notifyListeners();  // Ensure the listeners are notified of changes
  }

  // تحميل الحالة من SharedPreferences
  Future<void> _loadFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _lightModeEnable = prefs.getBool('lightModeEnable') ?? true; // الوضع الافتراضي هو الإضاءة
    notifyListeners();
  }

  // حفظ الحالة في SharedPreferences
  Future<void> _saveToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('lightModeEnable', _lightModeEnable);
  }
}
