import 'package:e_comrece_app/core/Di/di.dart';
import 'package:e_comrece_app/core/my_colors/my_colors.dart';
import 'package:e_comrece_app/home/home_screen/home_screen.dart';
import 'package:e_comrece_app/home/product_tab/domin/entity/product_entity.dart';
import 'package:e_comrece_app/home/product_tab/ui/cubit/product_view_model_cubit.dart';
import 'package:e_comrece_app/home/product_tab/ui/product_tab.dart';
import 'package:e_comrece_app/home/product_tab/ui/widgets/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../auth/ui/widgets/dailog_utils.dart';

class ProductItem extends StatelessWidget {
  final Product product;

//var  viewModel=getIt.get<ProductViewModelCubit>();

   const ProductItem({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
var viewModel=context.watch<ProductViewModelCubit>();
    return    Container(
      height: 237.h,
      width: 191.w,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15.r,
          ),
          border: Border.all(color: MyColors.primaryColor, width: 2.w)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            product.imageCover ?? "",
            height: 117.h,
            width: 191.w,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w, bottom: 3.h, top: 3.h),
            child: Text(
              product.title ?? "",
              style: TextStyle(
                  color: MyColors.primaryColor, fontSize: 14.sp),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text("EGP ${product.price}",
                style:
                TextStyle(color: MyColors.primaryColor, fontSize: 14.sp),
                textAlign: TextAlign.start),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w, right: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Review ( ${product.ratingsAverage})",
                    style: TextStyle(
                        color: MyColors.primaryColor, fontSize: 14.sp),
                    textAlign: TextAlign.start),
                Image.asset("lib/core/my_assets/images/star_icon.png"),
                InkWell(
                  onTap: () {
                    viewModel.addToCart(product.id ?? "");

                  },
                  child: Container(
                      padding:  EdgeInsets.only(
                          left: 4, top: 1.h, right: 2, bottom: 1.h),
                      child: Image.asset(
                          "lib/core/my_assets/images/add_cart.png")),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}