import 'package:e_comrece_app/core/Di/di.dart';
import 'package:e_comrece_app/core/shared_prefs/shared_prefs.dart';
import 'package:e_comrece_app/home/product_tab/ui/cubit/product_view_model_cubit.dart';
import 'package:e_comrece_app/home/product_tab/ui/widgets/cart_screen.dart';
import 'package:e_comrece_app/home/product_tab/ui/widgets/product_details_widget.dart';
import 'package:e_comrece_app/home/product_tab/ui/widgets/product_itme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/my_colors/my_colors.dart';
import '../../home_tab/ui/widgets/custom_text_filed.dart';

class ProductTab extends StatelessWidget {
  final viewModel = getIt.get<ProductViewModelCubit>();

  ProductTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      /// lazy: false,
      create: (context) => viewModel..getAllProducts(),
      child: BlocBuilder<ProductViewModelCubit, ProductViewModelState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 14.h),
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
                    Padding(
                      padding: EdgeInsets.only(right: 20.w, left: 10.w),
                      child: InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, CartScreen.routName);
                        },
                        child: Badge(
                          label: Text(viewModel.numOfCart.toString()),
                          child: Image.asset(
                              "lib/core/my_assets/images/shoppingcart.png",
                              height: 30.h,
                              width: 30.w),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
              state is LoadingState
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 2.4,
                            mainAxisSpacing: 10.h,
                            crossAxisSpacing: 8.w),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ProductDetailsWidget.routName,
                                arguments: viewModel.products[index]);
                          },
                          child: ProductItem(
                            product: viewModel.products[index],
                          ),
                        ),
                        itemCount: viewModel.products.length,
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}
/* InkWell(onTap: (){}, child: Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Badge(
                      label:Text(state.addToCartEntity.numOfCartItems.toString()) ,
                      child: Image.asset(
                          "lib/core/my_assets/images/shoppingcart.png",
                          height: 30.h,
                          width: 30.w),
                    ),
                  ));*/
