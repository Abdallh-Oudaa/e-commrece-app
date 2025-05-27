import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_comrece_app/home/product_tab/domin/entity/get_cart_items_entity.dart';
import 'package:e_comrece_app/home/product_tab/ui/cubit/product_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/my_colors/my_colors.dart';

class CartItem extends StatelessWidget {
  final GetCartItemsEntity getCartItemsEntity;
  final int index;
  const CartItem(
      {required this.getCartItemsEntity, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel=BlocProvider.of<ProductViewModelCubit>(context);
    return Container(
        margin: EdgeInsets.only(bottom: 10.h, left: 10.w, right: 8.w),
        width: double.infinity,
        height: 110.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            18.sp,
          ),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              10,
            ),
            child: CachedNetworkImage(
              imageUrl: getCartItemsEntity
                      .data!.products?[index].productItem?.imageCover ??
                  "",
              height: 100.h,
              width: 100.w,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  width: 300.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                       height: 39.h,
                        width: 150.w,
                        child: Text(
                          getCartItemsEntity
                                  .data!.products?[index].productItem?.title ??
                              "",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: MyColors.secondryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.r),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          viewModel.deleteCartItem(getCartItemsEntity.data!.products?[index].productItem?.id??"");
                          viewModel.getCartItems();
                        },
                        child: Icon(
                          Icons.delete,
                          color: MyColors.secondryColor,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "count:",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "${getCartItemsEntity.data!.products?[index].count}",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                Container(
                  height: 40.h,
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  width: 300.w,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "EGP ${getCartItemsEntity.data?.products?[index].price}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: MyColors.secondryColor)),
                        Container(
                          // padding:const EdgeInsets.symmetric(horizontal: 0,vertical: 5),
                          height: double.infinity,
                          width: 100.w,
                          decoration: BoxDecoration(
                              color: MyColors.secondryColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: (){ viewModel.updateCart(getCartItemsEntity.data!.products?[index].productItem?.id??"",
                                    getCartItemsEntity.data!.products![index].count!-1??0);
                                viewModel.getCartItems();},
                                child: Image.asset(
                                  "lib/core/my_assets/images/delete_icon.png",
                                ),
                              ),
                              Text(
                                "${getCartItemsEntity.data!.products?[index].count}",
                                style: const TextStyle(color: Colors.white),
                              ),
                              InkWell(
                                onTap: (){
                                  viewModel.updateCart(getCartItemsEntity.data!.products?[index].productItem?.id??"",
                                      getCartItemsEntity.data!.products![index].count!+1??0);
                                  viewModel.getCartItems();
                                },
                                child: Image.asset(
                                    "lib/core/my_assets/images/add_icon.png"),
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
              ])
        ]));
  }
}
