import 'dart:io';


import 'package:e_comrece_app/core/my_theme/my_theme.dart';
import 'package:e_comrece_app/ui/Auth/login/Login_screen.dart';
import 'package:e_comrece_app/ui/Auth/register/register_screen.dart';
import 'package:e_comrece_app/ui/splash/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'core/Di/di.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  configureDependencies();
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatefulWidget {
  const ECommerceApp({super.key});

  @override
  State<ECommerceApp> createState() => _ECommerceAppState();
}

class _ECommerceAppState extends State<ECommerceApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => SafeArea(
        child: MaterialApp(
          theme: MyTheme.myTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.routName,
          routes: {
            RegisterScreen.routName: (context) => const RegisterScreen(),
            LoginScreen.routName: (context) => const LoginScreen(),

            SplashScreen.routName: (context) => const SplashScreen(),
      
          },
        ),
      ),
    );
  }
}
