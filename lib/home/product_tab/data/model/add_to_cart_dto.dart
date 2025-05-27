import 'package:e_comrece_app/home/product_tab/domin/entity/add_to_cart_entity.dart';

class AddToCartDto extends AddToCartEntity {
  AddToCartDto({
      super.status,
    super.message,
    super.numOfCartItems,
    });

  AddToCartDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
  }




}

