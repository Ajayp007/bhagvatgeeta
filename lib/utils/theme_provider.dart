import 'package:bhagvatgeeta/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool themeMode = true;


  void setTheme() async {
    if (SharedHelper.helper.getThemeData != null) {
      themeMode = await SharedHelper.helper.getThemeData();
    } else {
      themeMode = true;
    }

    notifyListeners();
  }

}
