



import '../../../domin/entites/Brand.dart';

abstract class BrandOnlineDataSourceContract{
  Future<List<Brand>?> getAllBrands();
}