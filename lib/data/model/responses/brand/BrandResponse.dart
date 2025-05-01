import '../../MetaData.dart';
import 'BrandDto.dart';

class BrandResponse {
  BrandResponse({
    this.results,
    this.metadata,
    this.data,
  });

  BrandResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(BrandDto.fromJson(v));
      });
    }
  }
  int? results;
  Metadata? metadata;
  List<BrandDto>? data;
}




