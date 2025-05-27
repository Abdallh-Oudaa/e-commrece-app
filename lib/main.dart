import 'dart:io';

import 'package:e_comrece_app/auth/ui/login/login_view_model_cubit.dart';
import 'package:e_comrece_app/core/my_theme/my_theme.dart';
import 'package:e_comrece_app/home/product_tab/ui/widgets/cart_screen.dart';
import 'package:e_comrece_app/home/product_tab/ui/widgets/product_details_widget.dart';
import 'package:e_comrece_app/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'auth/ui/login/Login_screen.dart';
import 'auth/ui/register/register_screen.dart';

import 'core/Di/di.dart';
import 'home/home_screen/home_screen.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  configureDependencies();
  runApp( ECommerceApp());
}

class ECommerceApp extends StatelessWidget {

   ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) =>
          SafeArea(
            child: MaterialApp(
              theme: MyTheme.myTheme,
              debugShowCheckedModeBanner: false,
              initialRoute: SplashScreen.routName,
              routes: {
                RegisterScreen.routName: (context) => const RegisterScreen(),
                LoginScreen.routName: (context) => const LoginScreen(),
                HomeScreen.routName: (context) => HomeScreen(),
                SplashScreen.routName: (context) => const SplashScreen(),
                ProductDetailsWidget.routName: (context) =>
                const ProductDetailsWidget(),
                CartScreen.routName: (context) => CartScreen(),
              },
            ),
          ),
    );
  }
}
