import '../../../home_tab/data/model/MetaData.dart';


class ProductResponseEntity {
  ProductResponseEntity({
    this.results,
    this.metadata,
    this.products,
    this.message,
  });

  int? results;
  Metadata? metadata;
  List<Product>? products;
  String? message;
}
class SubcategoryEntity  {
  SubcategoryEntity({
    this.id,
    this.name,
    this.slug,
    this.category,
  }
  );
  String? id;
  String? name;
  String? slug;
  String? category;}

class Product {
  Product({
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
}
class CategoryEntity {
  CategoryEntity({
    this.id,
    this.name,
    this.slug,
    this.image,});


  String? id;
  String? name;
  String? slug;
  String? image;



}



