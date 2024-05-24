
import 'package:bhagvatgeeta/screen/home/view/home_screen.dart';
import 'package:bhagvatgeeta/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const SplashScreen(),
  'home': (context) => const HomeScreen(),
};
