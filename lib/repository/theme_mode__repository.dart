import 'package:flutter/material.dart';

class ThemeModeRepository extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  void changeThemeData() {
    themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;

    notifyListeners();
  }
}
