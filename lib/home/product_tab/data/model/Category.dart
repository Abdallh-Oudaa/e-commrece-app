import 'package:e_comrece_app/home/product_tab/domin/entity/product_entity.dart';

class Category extends CategoryEntity {
  Category({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  Category.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}
