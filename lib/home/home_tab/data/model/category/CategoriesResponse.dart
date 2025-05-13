


import '../MetaData.dart';
import 'CategoryDto.dart';


class CategoriesResponse {
  CategoriesResponse({
      this.results, 
      this.metadata, 
      this.data,this.message});

  CategoriesResponse.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];

    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryDto.fromJson(v));
      });
    }
  }
  int? results;
  Metadata? metadata;
  List<CategoryDto>? data;
   String? message;



}


