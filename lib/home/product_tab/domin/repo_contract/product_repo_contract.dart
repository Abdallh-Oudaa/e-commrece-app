import 'package:dartz/dartz.dart';
import 'package:e_comrece_app/core/errors/error_handleing.dart';
import 'package:e_comrece_app/home/product_tab/domin/entity/add_to_cart_entity.dart';
import 'package:e_comrece_app/home/product_tab/domin/entity/product_entity.dart';

import '../entity/get_cart_items_entity.dart';

abstract class ProductRepoContract{
  Future<Either<GeneralErrors,List<Product>?>> getAllProducts();
  Future<Either<GeneralErrors,AddToCartEntity>> addProductToCart(String productId);
  Future<Either<GeneralErrors,GetCartItemsEntity>?> getCartItems();
  Future<Either<GeneralErrors,GetCartItemsEntity>?> deleteCart(String productId);
  Future<Either<GeneralErrors,GetCartItemsEntity>?> updateCart(String productId,int count);


}