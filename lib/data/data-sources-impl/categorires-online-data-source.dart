import 'package:e_comrece_app/data/api/api-manger.dart';
import 'package:e_comrece_app/domin/entities/category.dart';
import 'package:injectable/injectable.dart';

import '../data-source-contract/categories-data-source.dart';

@Injectable(as: CategoriesDataSource)
class CategoriesOnlineDataSource extends CategoriesDataSource {
  ApiManger apiManger;
  CategoriesOnlineDataSource({required this.apiManger});
  @override
  Future<List<Category>?> getAllCategories() async {
    var response = await apiManger.getAllCategories();
    return response?.data
        ?.map(
          (categoryDto) => categoryDto.toCategory(),
        )
        .toList();
  }
}
