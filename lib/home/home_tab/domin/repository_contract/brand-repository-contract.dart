

import '../entites/Brand.dart';


abstract class BrandRepositoryContract{
 Future<List<Brand>?> getAllBrands();
}