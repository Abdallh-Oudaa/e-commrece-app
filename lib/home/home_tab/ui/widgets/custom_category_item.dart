import 'package:e_comrece_app/auth/ui/login/Login_screen.dart';
import 'package:e_comrece_app/home/home_tab/domin/entites/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomCategoryItem extends StatelessWidget {
  Category category;

   CustomCategoryItem({ required this.category,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CircleAvatar(
       backgroundColor: Colors.transparent,
        radius: 50.r,
        child: ClipOval(child:  CachedNetworkImage(
          imageUrl: category.image??"",height: 100.h,width: 100.w,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),),

      ),
      SizedBox(height: 15.h,),
       Text(category.name??"",style:const TextStyle(color: Colors.blue,fontSize: 14,fontWeight: FontWeight.w400),),
    ],);
  }
}
