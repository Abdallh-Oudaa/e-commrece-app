import 'package:e_comrece_app/core/my_colors/my_colors.dart';

import 'package:e_comrece_app/home/product_tab/domin/entity/product_entity.dart';
import 'package:e_comrece_app/home/product_tab/ui/cubit/product_view_model_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsWidget extends StatelessWidget {
  static const String routName = "ProductDetailsWidget";
  const ProductDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
   // var viewModel=context.read<ProductViewModelCubit>();
    var args = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: MyColors.secondryColor),
        centerTitle: true,
        title: Text(
          "product Details",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: MyColors.secondryColor, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: Colors.grey, width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14.r),
                  child: ImageSlideshow(
                    autoPlayInterval: 3000,
                    indicatorPadding: 2,
                    isLoop: true,
                    width: double.infinity,
                    height: 200,
                    initialPage: 0,
                    indicatorColor: Colors.blue,
                    indicatorBackgroundColor: Colors.grey,
                    children: args.images!.map(
                      (url) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 0),
                          child: Image.network(
                            url,
                            height: 200.h,
                            width: double.infinity,
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
              SizedBox(height: 8.h,),
              Row(
                children: [
                  Expanded(
                    child: Text(args.title ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: MyColors.secondryColor)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Text("EGP ${args.price}",
                        style: TextStyle(
                            color: MyColors.secondryColor, fontSize: 18.sp),
                        textAlign: TextAlign.start),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        border: Border.all(color: Colors.grey, width: 2.w),
                      ),
                      child: Text(
                        "sold: ${args.sold}",
                        style: TextStyle(
                            color: MyColors.secondryColor, fontSize: 18),
                      )),
                  Row(
                    children: [
                      Image.asset("lib/core/my_assets/images/star_icon.png"),
                      SizedBox(
                        width: 6.w,
                      ),
                      Text(
                        "${args.ratingsAverage}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: MyColors.secondryColor),
                      )
                    ],
                  ),
                  Container(
                      width: 150.w,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: MyColors.primaryColor,
                        borderRadius: BorderRadius.circular(24.r),
                        border: Border.all(color: Colors.grey, width: 2.w),
                      ),
                      child: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                                "lib/core/my_assets/images/delete_icon.png"),
                            const Text(
                              "1",
                              style: TextStyle(color: Colors.white),
                            ),
                            Image.asset(
                                "lib/core/my_assets/images/add_icon.png"),
                          ],
                        ),
                      ))
                ],
              ),
              Text(
                "description",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: MyColors.secondryColor, fontSize: 20),
              ),
              SizedBox(
                height: 3.h,
              ),
              ReadMoreText(
                '${args.description} ',
                style: TextStyle(color: Colors.blueGrey,fontSize: 18.r),
                trimMode: TrimMode.Line,
                trimLines: 2,
                colorClickableText: MyColors.secondryColor,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                moreStyle:  TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: MyColors.secondryColor),
                lessStyle:  TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: MyColors.secondryColor),
              ),
              SizedBox(height: 8.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      "total price:\n EGP: ${args.price}",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: MyColors.secondryColor,
                          fontSize: 18.r,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    width: 200.w,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: MyColors.primaryColor,
                      borderRadius: BorderRadius.circular(24.r),
                      border: Border.all(color: Colors.grey, width: 2.w),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ImageIcon(
                            const AssetImage(
                              "lib/core/my_assets/images/shoppingcart.png",
                            ),
                            size: 15.sp,
                            color: Colors.white,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text("Add to card "),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
