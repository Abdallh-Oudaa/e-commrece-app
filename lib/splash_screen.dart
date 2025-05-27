import 'dart:async';

import 'package:e_comrece_app/auth/ui/login/Login_screen.dart';
import 'package:e_comrece_app/core/shared_prefs/shared_prefs.dart';
import 'package:e_comrece_app/home/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

import 'auth/ui/register/register_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routName = "splash screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    Timer(
      const Duration(seconds: 2),
      () async{


        final navigator=Navigator.of(context);
        String? token = await SharedPrefs.getData("token");
        if (token == null) {
          navigator.pushReplacementNamed( LoginScreen.routName);
        } else {
          navigator.pushReplacementNamed( HomeScreen.routName);
        }
      },
    );
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "lib/core/my_assets/images/Splash Screen.png",
            ),
            fit: BoxFit.cover),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
