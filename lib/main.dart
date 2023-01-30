import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'HomePage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_gif/flutter_gif.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  late FlutterGifController controller;
  @override
  void initState() {
    super.initState();
    controller = FlutterGifController(vsync: this);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AnimatedSplashScreen(
            duration: 3000,
            splash: Image.asset(
              'images/VMovies.gif',
            ),
            nextScreen: HomePage(),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.fade,
            backgroundColor: Color(0xFF131738),
          ));
    });
  }
}
