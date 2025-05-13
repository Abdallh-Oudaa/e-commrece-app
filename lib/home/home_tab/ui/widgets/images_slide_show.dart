import 'package:e_comrece_app/auth/ui/login/Login_screen.dart';
import 'package:e_comrece_app/core/Di/di.dart';
import 'package:e_comrece_app/home/home_tab/ui/cubit/home_tab_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagesSlideShow extends StatelessWidget {
  var viewModel=getIt.get<HomeTabViewModelCubit>();
   ImagesSlideShow({super.key});

  @override
  Widget build(BuildContext context) {
    return  ImageSlideshow(
      autoPlayInterval: 3000,
      indicatorPadding: 2,
      isLoop: true,
      width: double.infinity,
      height: 200,
      initialPage: 0,
      indicatorColor: Colors.blue,
      indicatorBackgroundColor: Colors.grey,
      children:viewModel.imagesPath.map((url) {
        return Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 0),
          child: Image.asset(url,height: 200.h,width: 400.w,),
        );
      },).toList(),
    );
  }
}
