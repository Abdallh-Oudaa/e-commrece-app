import 'package:e_comrece_app/home/product_tab/domin/entity/product_entity.dart';

class Subcategory extends SubcategoryEntity {
  Subcategory({
    super.id,
    super.name,
    super.slug,
    super.category,
  });

  Subcategory.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['category'] = category;
    return map;
  }
}
