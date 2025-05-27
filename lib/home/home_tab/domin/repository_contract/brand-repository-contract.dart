

import 'package:dartz/dartz.dart';

import '../../../../core/errors/error_handleing.dart';
import '../entites/Brand.dart';



abstract class BrandRepositoryContract{
 Future<Either<GeneralErrors,List<Brand>>?> getAllBrands();
}