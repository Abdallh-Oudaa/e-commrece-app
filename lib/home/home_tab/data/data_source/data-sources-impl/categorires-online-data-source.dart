import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api/api-manger.dart';
import '../../../../../core/errors/error_handleing.dart';
import '../../../domin/entites/category.dart';
import '../data_source_contract/categories-data-source.dart';

@Injectable(as: CategoriesDataSource)
class CategoriesOnlineDataSource extends CategoriesDataSource {
  ApiManger apiManger;
  CategoriesOnlineDataSource({required this.apiManger});
  @override
  Future<Either<GeneralErrors, List<Category>>?> getAllCategories() async {
    var response = await apiManger.getAllCategories();
    return response?.fold(
      (error) {
        return left(GeneralErrors(message: error.message));
      },
      (response) {
        return right(response.data!.map(
          (e) {
            return e.toCategory();
          },
        ).toList());
      },
    );
  }
}
