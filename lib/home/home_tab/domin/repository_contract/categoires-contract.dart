

import 'package:dartz/dartz.dart';

import '../../../../core/errors/error_handleing.dart';
import '../entites/category.dart';

abstract class CategoriesContract{
 Future<Either<GeneralErrors,List<Category>>?> getAllCategories();
}