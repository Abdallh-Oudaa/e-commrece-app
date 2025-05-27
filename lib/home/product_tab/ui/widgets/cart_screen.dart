import 'package:e_comrece_app/auth/ui/widgets/dailog_utils.dart';
import 'package:e_comrece_app/core/Di/di.dart';
import 'package:e_comrece_app/core/my_colors/my_colors.dart';
import 'package:e_comrece_app/home/product_tab/ui/cubit/product_view_model_cubit.dart';
import 'package:e_comrece_app/home/product_tab/ui/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  var viewModel = getIt.get<ProductViewModelCubit>();
  static const String routName = "cart screen";
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) =>viewModel..getCartItems(),
  child: BlocBuilder<ProductViewModelCubit, ProductViewModelState>(
      bloc: viewModel..getCartItems(),
      builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(
              "Cart",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: MyColors.secondryColor),
            ),
            centerTitle: true,
          ),
          body: state is GetCartItemsSuccessState
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        child: ListView.builder(
                      itemBuilder: (context, index) => CartItem(
                        getCartItemsEntity: state.getCartItemsEntity,
                        index: index,
                      ),
                      itemCount: state.getCartItemsEntity.numOfCartItems,
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Text(
                                "total price",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: MyColors.secondryColor),
                              ),
                              Text(
                                "${state.getCartItemsEntity.data?.totalCartPrice} ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: MyColors.secondryColor),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Image.asset(
                                  "lib/core/my_assets/images/check-out.png"),
                            ))
                      ],
                    )
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                )),
    ),
);
  }
}
