import 'package:dartz/dartz.dart';
import 'package:e_comrece_app/core/api/api-manger.dart';
import 'package:e_comrece_app/core/errors/error_handleing.dart';
import 'package:e_comrece_app/home/product_tab/data/data_source/product_online_data_source.dart';
import 'package:e_comrece_app/home/product_tab/domin/entity/add_to_cart_entity.dart';
import 'package:e_comrece_app/home/product_tab/domin/entity/get_cart_items_entity.dart';
import 'package:e_comrece_app/home/product_tab/domin/entity/product_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductOnlineDataSource)
class ProductOnlineDataSourceImpl extends ProductOnlineDataSource {
  ApiManger apiManger;
  ProductOnlineDataSourceImpl({required this.apiManger});
  @override
  Future<Either<GeneralErrors, List<Product>?>> getAllProducts() async {
    var response = await apiManger.getAllProducts();
    return response!.fold(
      (l) {
        return left(l);
      },
      (r) {
        return Right(r.data
            ?.map(
              (e) => e.changeToProduct(),
            )
            .toList());
      },
    );
  }

  @override
  Future<Either<GeneralErrors, AddToCartEntity>> addToCart(
      String productId) async {
    var response = await apiManger.addToCart(productId);
    return response!.fold(
      (l) => left(l),
      (r) => Right(r),
    );
  }

  @override
  Future<Either<GeneralErrors, GetCartItemsEntity>?> getCartItems() async {
    var response = await apiManger.getCartItems();
    return response?.fold(
      (l) => left(l),
      (r) => Right(r),
    );
  }

  @override
  Future<Either<GeneralErrors, GetCartItemsEntity>?> deleteCart(String productId)async {
    var response = await apiManger.deleteCart(productId);
    return response?.fold(
          (l) => left(l),
          (r) => Right(r),
    );
  }

  @override
  Future<Either<GeneralErrors, GetCartItemsEntity>?> updateCart(String productId, int count) async{
    var response = await apiManger.updateCart(productId,count);
    return response?.fold(
          (l) => left(l),
          (r) => Right(r),
    );
  }
}
