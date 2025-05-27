import 'package:e_comrece_app/home/product_tab/domin/entity/product_entity.dart';

import 'Subcategory.dart';
import 'Category.dart';

class ProductDto  {
  int? sold;
  List<String>? images;
  List<SubcategoryEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  CategoryEntity? category;
  dynamic brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  ProductDto({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });
  Product changeToProduct() {
    return Product(
      updatedAt: updatedAt,
      createdAt: createdAt,
      ratingsAverage: ratingsAverage,
      brand: brand,
      category: category,
      imageCover: imageCover,
      price: price,
      quantity: quantity,
      description: description,
      slug: slug,
      title: title,
      id: id,
      ratingsQuantity: ratingsAverage,
      subcategory: subcategory,
      images: images,
      sold: sold,
    );
  }

  ProductDto.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(Subcategory.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    brand = json['brand'];
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }
}
