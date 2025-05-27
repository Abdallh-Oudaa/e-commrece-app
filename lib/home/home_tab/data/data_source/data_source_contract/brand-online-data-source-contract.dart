



import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_handleing.dart';
import '../../../domin/entites/Brand.dart';

abstract class BrandOnlineDataSourceContract{
  Future<Either<GeneralErrors, List<Brand>>?> getAllBrands();
}