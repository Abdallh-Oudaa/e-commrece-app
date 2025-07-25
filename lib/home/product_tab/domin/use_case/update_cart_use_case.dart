import 'package:dartz/dartz.dart';
import 'package:e_comrece_app/core/errors/error_handleing.dart';
import 'package:e_comrece_app/home/product_tab/domin/entity/get_cart_items_entity.dart';
import 'package:e_comrece_app/home/product_tab/domin/repo_contract/product_repo_contract.dart';

import 'package:injectable/injectable.dart';
@injectable
class UpdateCartUseCase{
  ProductRepoContract getCartRepoContract;
  UpdateCartUseCase({required this.getCartRepoContract});
  Future<Either<GeneralErrors, GetCartItemsEntity>?> invoke(String productId ,int count){
    return  getCartRepoContract.updateCart(productId,count);
  }
}