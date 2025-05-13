import 'package:e_comrece_app/core/Di/di.dart';
import 'package:e_comrece_app/home/home_tab/ui/cubit/home_tab_view_model_cubit.dart';
import 'package:e_comrece_app/home/home_tab/ui/widgets/categoires_row_widget.dart';
import 'package:e_comrece_app/home/home_tab/ui/widgets/categoires_section.dart';
import 'package:e_comrece_app/home/home_tab/ui/widgets/custom_category_item.dart';
import 'package:e_comrece_app/home/home_tab/ui/widgets/custom_text_filed.dart';
import 'package:e_comrece_app/home/home_tab/ui/widgets/images_slide_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class HomeTab extends StatelessWidget {
  var viewModel = getIt.get<HomeTabViewModelCubit>();
  HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 9.sp,
              right: 8.sp,
            ),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextFiled(
                    prefixIcon: Icons.search,
                    hintText: "what you search for",
                    validation: (text) {
                      if (text!.trim().isEmpty) {
                        return "field is empty";
                      }
      
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    controller: viewModel.search,
                  ),
                ),
                const SizedBox(width: 8),
                Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: Image.asset(
                      "lib/core/my_assets/images/shoppingcart.png",
                      height: 30.h,
                      width: 30.w),
                ),
              ],
            ),
          ),
          //  SizedBox(height: 2.h,),
          ImagesSlideShow(),
          const SizedBox(
            height: 3,
          ),
          const CategoiresRowWidget(),
          CategoriesSection(),
        ],
      ),
    );
  }
}
