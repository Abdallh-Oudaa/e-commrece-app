

import '../../domin/entities/Brand.dart';

abstract class BrandOnlineDataSourceContract{
  Future<List<Brand>?> getAllBrands();
}