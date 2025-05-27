class ProductIdReq{
  String? productId;
  ProductIdReq(this.productId);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = productId;
    return map;
  }
}