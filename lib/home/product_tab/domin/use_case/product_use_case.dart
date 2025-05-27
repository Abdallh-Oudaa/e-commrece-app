import 'package:dartz/dartz.dart';
import 'package:e_comrece_app/core/errors/error_handleing.dart';
import 'package:e_comrece_app/home/product_tab/domin/entity/product_entity.dart';
import 'package:e_comrece_app/home/product_tab/domin/repo_contract/product_repo_contract.dart';
import 'package:injectable/injectable.dart';
@injectable
class ProductUseCase{
  ProductRepoContract productRepoContract;
  ProductUseCase({required this.productRepoContract});
  Future<Either<GeneralErrors,List<Product>?>> getAllProducts (){
    return productRepoContract.getAllProducts();
}
}