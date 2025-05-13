import 'dart:async';


import 'package:flutter/material.dart';


import 'auth/ui/register/register_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routName = "splash screen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, RegisterScreen.routName);
      },
    );
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "lib/core/my_assets/images/Splash Screen.png",
            ),fit: BoxFit.cover
          ),
    ),
    child: const Scaffold(backgroundColor: Colors.transparent,),);
  }
}
