import 'package:dartz/dartz.dart';
import 'package:e_comrece_app/core/errors/error_handleing.dart';
import 'package:e_comrece_app/home/product_tab/data/data_source/product_online_data_source.dart';
import 'package:e_comrece_app/home/product_tab/domin/entity/add_to_cart_entity.dart';
import 'package:e_comrece_app/home/product_tab/domin/entity/get_cart_items_entity.dart';
import 'package:e_comrece_app/home/product_tab/domin/entity/product_entity.dart';
import 'package:e_comrece_app/home/product_tab/domin/repo_contract/product_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepoContract)
class ProductRepoImpl extends ProductRepoContract {
  ProductOnlineDataSource productOnlineDataSource;

  ProductRepoImpl({required this.productOnlineDataSource});
  @override
  Future<Either<GeneralErrors, List<Product>?>> getAllProducts() {
    return productOnlineDataSource.getAllProducts();
  }

  @override
  Future<Either<GeneralErrors, AddToCartEntity>> addProductToCart(String productId) {
   return productOnlineDataSource.addToCart(productId);
  }

  @override
  Future<Either<GeneralErrors, GetCartItemsEntity>?> getCartItems() {
   return productOnlineDataSource.getCartItems();
  }

  @override
  Future<Either<GeneralErrors, GetCartItemsEntity>?> deleteCart(String productId) {
  return  productOnlineDataSource.deleteCart(productId);
  }

  @override
  Future<Either<GeneralErrors, GetCartItemsEntity>?> updateCart(String productId, int count) {
  return productOnlineDataSource.updateCart(productId, count);
  }
}
