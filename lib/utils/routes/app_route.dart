import 'package:festive_post_app/screen/festival/festival_screen.dart';
import 'package:festive_post_app/screen/home/home_screen.dart';
import 'package:festive_post_app/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';
Map<String,WidgetBuilder> app_route= {
  "/":(context) => SplashScreen(),
  "home": (context) => HomeScreen(),
  "festival": (context) => FestivalScreen(),
};