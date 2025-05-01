import 'package:e_comrece_app/domin/entities/Brand.dart';


abstract class BrandRepositoryContract{
 Future<List<Brand>?> getAllBrands();
}