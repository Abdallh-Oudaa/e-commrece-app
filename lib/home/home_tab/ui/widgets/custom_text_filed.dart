import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/my_colors/my_colors.dart';

class CustomTextFiled extends StatelessWidget {
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final String? addressText;
  final String? hintText;
  final String? Function(String?) validation;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final bool? obsText;

  const CustomTextFiled(
      {required this.hintText,
      required this.validation,
      required this.keyboardType,
      required this.controller,
      this.obsText = false,
      this.suffixIcon,
      this.addressText,
      this.prefixIcon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: MyColors.primaryColor,
        ),
        suffixIcon: suffixIcon,
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              25,
            ),
            borderSide: BorderSide(color: MyColors.primaryColor, width: 2.sp)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              25,
            ),
            borderSide: BorderSide(color: MyColors.primaryColor, width: 2.sp)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
          25,
        )),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: MyColors.primaryColor, fontWeight: FontWeight.w300),
        errorStyle: TextStyle(fontSize: 20.sp, color: Colors.red),
      ),
      obscureText: obsText!,
      keyboardType: keyboardType,
      validator: validation,
      controller: controller,
    );
  }
}
