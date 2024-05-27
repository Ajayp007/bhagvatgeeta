import 'package:bhagvatgeeta/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool themeMode = true;

  void setTheme() async {
    themeMode = await getThemeData();
    notifyListeners();
  }
}
