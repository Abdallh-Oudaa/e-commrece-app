import 'package:e_comrece_app/home/product_tab/domin/entity/get_cart_items_entity.dart';

class GetCartItemsDto extends GetCartItemsEntity {
  GetCartItemsDto({
    super.status,
    super.numOfCartItems,
    super.cartId,
    super.data,
  });

  GetCartItemsDto.fromJson(dynamic json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? DataOfCartItems.fromJson(json['data']) : null;
  }
}

class DataOfCartItems extends DataOfCartItemsEntity {
  DataOfCartItems({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  DataOfCartItems.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(ProductsOfCartItems.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class ProductsOfCartItems extends ProductsOfCartItemsEntity {
  ProductsOfCartItems({
    super.count,
    super.id,
    super.productItem,
    super.price,
  });

  ProductsOfCartItems.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    productItem = json['product'] != null
        ? OneItemOfProduct.fromJson(json['product'])
        : null;
    price = json['price'];
  }
}

class OneItemOfProduct extends OneItemOfProductEntity {
  OneItemOfProduct({
    super.id,
    super.title,
    super.quantity,
    super.imageCover,
    super.ratingsAverage,
  });

  OneItemOfProduct.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];

    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }
}
