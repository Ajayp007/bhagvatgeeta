import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.network(
          "https://rukminim2.flixcart.com/image/850/1000/jyyqc280/regionalbooks/y/6/3/srimad-bhagavad-gita-as-it-is-hindi-2018-new-edition-hardcover-original-imaf79gzwhhey4zz.jpeg?q=90&crop=false",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
