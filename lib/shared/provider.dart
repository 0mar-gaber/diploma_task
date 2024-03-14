import 'package:flutter/material.dart';

class ScreensProvider extends ChangeNotifier{

  ThemeMode themeMode = ThemeMode.light;
  changeAppTheme(ThemeMode newThemeMode ){
    themeMode = newThemeMode ;
    notifyListeners();
  }

}