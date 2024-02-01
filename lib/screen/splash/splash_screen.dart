import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds:3),()=>Navigator.pushReplacementNamed(context, 'home'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/logo/festival.jpg",height: 150,width: 150),
              const SizedBox(height: 5,),
              const Text("Festival Post APP",
                style: TextStyle(
                    fontSize: 30,color: Colors.lightGreen,
                    fontWeight: FontWeight.bold,
                    fontFamily: "font1",
                ),
              )
            ],
          ),
        )
    );
  }
}
