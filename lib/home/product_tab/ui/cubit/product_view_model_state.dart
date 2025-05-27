part of 'product_view_model_cubit.dart';

@immutable
sealed class ProductViewModelState {}

final class ProductViewModelInitial extends ProductViewModelState {}
final class SuccessState extends ProductViewModelState {
 final List<Product>? product;
  SuccessState({required this.product});
}
final class ErrorState extends ProductViewModelState {
 final String? message;
  ErrorState({required this.message});
}

final class LoadingState extends ProductViewModelState {}

final class CartSuccessState extends ProductViewModelState {
 final AddToCartEntity addToCartEntity;
 CartSuccessState({required this.addToCartEntity});
}
final class GetCartItemsSuccessState extends ProductViewModelState {
 final GetCartItemsEntity getCartItemsEntity;
 GetCartItemsSuccessState({required this.getCartItemsEntity});
}