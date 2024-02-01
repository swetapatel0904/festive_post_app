import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:festive_post_app/screen/home/home_screen.dart';
import 'package:festive_post_app/utils/routes/app_route.dart';

void main()
{
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: app_route,
      )
  );

}