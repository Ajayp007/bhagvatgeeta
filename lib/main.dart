import 'package:bhagvatgeeta/utils/routes.dart';
import 'package:bhagvatgeeta/utils/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
       darkTheme: darkTheme,
       routes: appRoutes,
    ),
  );
}
