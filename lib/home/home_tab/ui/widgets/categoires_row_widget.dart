import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoiresRowWidget extends StatelessWidget {
  const CategoiresRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "categories",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: const Color(0xff06004F)),
          ),
          Text(
            "view all",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: const Color(0xff06004F),
                fontSize: 18.sp,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
