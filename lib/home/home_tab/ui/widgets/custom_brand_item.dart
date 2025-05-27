import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_comrece_app/home/home_tab/domin/entites/Brand.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBrandItem extends StatelessWidget {
 final Brand brand;
  const CustomBrandItem({required this.brand, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 50.r,
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: brand.image ?? "",
              height: 100.h,
              width: 100.w,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          brand.name ?? "",
          style: const TextStyle(
              color: Colors.blue, fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
