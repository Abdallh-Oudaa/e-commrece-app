import 'package:e_comrece_app/home/product_tab/domin/entity/product_entity.dart';

import '../../../home_tab/domin/entites/Brand.dart';
import '../../../home_tab/domin/entites/category.dart';

class GetCartItemsEntity {
  GetCartItemsEntity({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  String? status;
  int? numOfCartItems;
  String? cartId;
  DataOfCartItemsEntity? data;
}

class DataOfCartItemsEntity {
  DataOfCartItemsEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  String? id;
  String? cartOwner;
  List<ProductsOfCartItemsEntity>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;
}

class ProductsOfCartItemsEntity {
  ProductsOfCartItemsEntity({
    this.count,
    this.id,
    this.productItem,
    this.price,
  });

  int? count;
  String? id;
  OneItemOfProductEntity? productItem;
  int? price;
}

class OneItemOfProductEntity {
  OneItemOfProductEntity({

    this.id,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });


  String? id;
  String? title;
  int? quantity;
  String? imageCover;
  Category? category;
  Brand? brand;
  double? ratingsAverage;
}


