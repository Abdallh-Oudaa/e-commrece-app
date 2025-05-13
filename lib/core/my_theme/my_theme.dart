import 'package:flutter/material.dart';

import '../my_colors/my_colors.dart';

class MyTheme {
  static ThemeData myTheme = ThemeData(
    textTheme: TextTheme(
      bodyMedium: const TextStyle(
          fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white),
      bodySmall: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 14,
          color: MyColors.primaryColor),
    ),

  );
}
