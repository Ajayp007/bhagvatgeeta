import 'package:bhagvatgeeta/screen/home/provider/home_provider.dart';
import 'package:bhagvatgeeta/utils/routes.dart';
import 'package:bhagvatgeeta/utils/theme.dart';
import 'package:bhagvatgeeta/utils/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ThemeProvider()),
        ChangeNotifierProvider.value(value: HomeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          value.setTheme();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
                value.themeMode == true ? ThemeMode.light : ThemeMode.dark,
            routes: appRoutes,
          );
        },
      ),
    ),
  );
}
