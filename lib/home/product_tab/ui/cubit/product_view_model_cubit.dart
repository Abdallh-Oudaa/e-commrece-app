import 'package:bloc/bloc.dart';
import 'package:e_comrece_app/core/shared_prefs/shared_prefs.dart';

import 'package:e_comrece_app/home/product_tab/domin/entity/add_to_cart_entity.dart';
import 'package:e_comrece_app/home/product_tab/domin/entity/get_cart_items_entity.dart';
import 'package:e_comrece_app/home/product_tab/domin/entity/product_entity.dart';
import 'package:e_comrece_app/home/product_tab/domin/use_case/add_to_cart_use_case.dart';
import 'package:e_comrece_app/home/product_tab/domin/use_case/delete_cart.dart';
import 'package:e_comrece_app/home/product_tab/domin/use_case/get_cart_items.dart';
import 'package:e_comrece_app/home/product_tab/domin/use_case/product_use_case.dart';
import 'package:e_comrece_app/home/product_tab/domin/use_case/update_cart_use_case.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'product_view_model_state.dart';

@injectable
class ProductViewModelCubit extends Cubit<ProductViewModelState> {
  ProductUseCase productUseCase;
  UpdateCartUseCase updateCartUseCase;
  DeleteCartItemsUseCase deleteCartItemsUseCase;
  AddToCartUseCase addToCartUseCase;
  GetCartItemsUseCase getCartItemsUseCase;
  List<Product> products = [];
  int numOfCart = 0;

  TextEditingController search = TextEditingController();
  ProductViewModelCubit(
      this.productUseCase,
      this.addToCartUseCase,
      this.getCartItemsUseCase,
      this.deleteCartItemsUseCase,
      this.updateCartUseCase)
      : super(ProductViewModelInitial());
  void getAllProducts() async {
    emit(LoadingState());
    var response = await productUseCase.getAllProducts();
    return response.fold((l) => emit(ErrorState(message: l.message)), (r) {
      products = r ?? [];
      emit(SuccessState(product: r));
    });
  }

  void addToCart(String productId) async {
    var response = await addToCartUseCase.addToCart(productId);
    response.fold((l) => emit(ErrorState(message: l.message)), (r) {
      numOfCart = r.numOfCartItems ?? 0;

      emit(CartSuccessState(addToCartEntity: r));
    });
  }

  void getCartItems() async {
    var response = await getCartItemsUseCase.invoke();
    response?.fold((l) => emit(ErrorState(message: l.message)), (r) {
      emit(GetCartItemsSuccessState(getCartItemsEntity: r));
    });
  }

  void deleteCartItem(String productId) async {
    var response = await deleteCartItemsUseCase.invoke(productId);
    response?.fold((l) => emit(ErrorState(message: l.message)), (r) {
      emit(GetCartItemsSuccessState(getCartItemsEntity: r));
    });
  }

  void updateCart(String productId, int count) async {
    var response = await updateCartUseCase.invoke(productId,count);
    response?.fold((l) => emit(ErrorState(message: l.message)), (r) {
      emit(GetCartItemsSuccessState(getCartItemsEntity: r));
    });
  }
}
