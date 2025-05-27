import 'package:e_comrece_app/home/product_tab/domin/entity/product_entity.dart';

import '../../../home_tab/data/model/MetaData.dart';
import 'product_dto.dart';

class ProductResponseDto {
  ProductResponseDto({this.results, this.metadata, this.data, this.message});

  ProductResponseDto.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];

    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDto.fromJson(v));
      });
    }
  }

  List<ProductDto>? data;
  int? results;
  Metadata? metadata;

  String? message;
}
