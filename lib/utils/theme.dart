import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    centerTitle: true,

  ),
    switchTheme: SwitchThemeData(trackColor: WidgetStateProperty.all(Colors.green) )
);
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
);
