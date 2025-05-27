import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerWidget extends StatelessWidget {
  final String title;
  final String nameOrEmail;
  const CustomContainerWidget(
      {required this.title, required this.nameOrEmail, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),

      child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(

            padding:  EdgeInsets.all(8.0.sp),
            child: Text(
              title,
              style: TextStyle(fontSize: 25.sp, color: Colors.black),textAlign: TextAlign.start,
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: Colors.blueGrey, width: 1)),
            child: Text(
              nameOrEmail,
              style: TextStyle(color: Colors.black, fontSize: 25.sp),
            ),
          ),
        ],
      ),
    );
  }
}
