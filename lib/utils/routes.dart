import 'package:bhagvatgeeta/like/view/like_screen.dart';
import 'package:bhagvatgeeta/screen/home/view/home_screen.dart';
import 'package:bhagvatgeeta/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import '../screen/chapter/view/chapter_screen.dart';

Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const SplashScreen(),
  'home': (context) => const HomeScreen(),
  'detail': (context) => const DetailScreen(),
  'like': (context) => const LikeScreen(),
};
