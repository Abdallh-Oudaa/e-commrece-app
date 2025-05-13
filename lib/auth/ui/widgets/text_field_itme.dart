import 'package:e_comrece_app/core/my_colors/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldItem extends StatelessWidget {
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final String? addressText;
  final String? hintText;
  final String? Function(String?) validation;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final bool? obsText;

  const TextFieldItem(
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 18.h, left: 10.w),
          child: Text(
            addressText ?? "",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontSize: 18.sp),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding:
              EdgeInsets.only(top: 10.h, bottom: 5.h, left: 10.w, right: 10.w),
          child: TextFormField(
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              prefixIcon: Icon(
                prefixIcon,
                color: MyColors.primaryColor,
              ),
              suffixIcon: suffixIcon,
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                20,
              )),
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: MyColors.hintTextColor, fontWeight: FontWeight.w300),
              errorStyle: TextStyle(fontSize: 20.sp, color: Colors.red),
            ),
            obscureText: obsText!,
            keyboardType: keyboardType,
            validator: validation,
            controller: controller,
          ),
        ),
      ],
    );
  }
}
