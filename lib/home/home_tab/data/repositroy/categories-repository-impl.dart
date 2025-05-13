import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/error_handleing.dart';
import '../../domin/entites/category.dart';
import '../../domin/repository_contract/categoires-contract.dart';
import '../data_source/data_source_contract/categories-data-source.dart';

@Injectable(as: CategoriesContract)
class CategoriesRepositoryImpl extends CategoriesContract {
  CategoriesDataSource categoriesDataSource;
  CategoriesRepositoryImpl({required this.categoriesDataSource});
  @override
  Future<Either<GeneralErrors, List<Category>>?> getAllCategories() async {
    var response = await categoriesDataSource.getAllCategories();
    return response?.fold(
      (error) {
        return left(GeneralErrors(message: error.message));
      },
      (categoryList) {
        return right(categoryList);
      },
    );
  }
}
