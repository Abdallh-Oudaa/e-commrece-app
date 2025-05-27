import 'package:dartz/dartz.dart';
import 'package:e_comrece_app/home/product_tab/domin/entity/add_to_cart_entity.dart';
import 'package:e_comrece_app/home/product_tab/domin/repo_contract/product_repo_contract.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/error_handleing.dart';

@injectable
class AddToCartUseCase{
  ProductRepoContract productRepoContract;
  AddToCartUseCase({required this.productRepoContract});
  Future<Either<GeneralErrors,AddToCartEntity>> addToCart (String productId){
    return productRepoContract.addProductToCart(productId);
  }
}