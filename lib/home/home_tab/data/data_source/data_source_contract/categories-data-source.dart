








import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_handleing.dart';
import '../../../domin/entites/category.dart';

abstract class CategoriesDataSource{
 Future<Either<GeneralErrors,List<Category>>?> getAllCategories();
}