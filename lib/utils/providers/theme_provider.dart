import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;
  // making sure whether a previous theme exist on app initializion
  // 
  ThemeProvider() {
    _loadThemeFromPreferences();
  }

// loading the def
   void _loadThemeFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? theme = prefs.getString('themeMode');
    if (theme != null) {
      if (theme == 'light') {
        _themeMode = ThemeMode.light;
      } else if (theme == 'dark') {
        _themeMode = ThemeMode.dark;
      } else {
        _themeMode = ThemeMode.system;
      }
    }
    notifyListeners();
  }
  // saving the theme to SP
  void _saveThemeToPreferences(String theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeMode', theme);
  }



  void setThemeModeDark() {
    _themeMode = ThemeMode.dark;
    _saveThemeToPreferences('dark');
    notifyListeners();
  }

  void setThemeModeLight() {
    _themeMode = ThemeMode.light;
    _saveThemeToPreferences('light');
    notifyListeners();
  }

  void setThemeModeSystem() {
    _themeMode = ThemeMode.system;
    _saveThemeToPreferences('system');
    notifyListeners();
  }
}
