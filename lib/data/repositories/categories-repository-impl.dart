import 'package:e_comrece_app/data/data-source-contract/categories-data-source.dart';
import 'package:e_comrece_app/domin/entities/category.dart';

import 'package:injectable/injectable.dart';

import '../../domin/repositories_contract/categoires-contract.dart';
@Injectable(as: CategoriesContract)
class CategoriesRepositoryImpl extends CategoriesContract{
  CategoriesDataSource categoriesDataSource;
  CategoriesRepositoryImpl({required this.categoriesDataSource});
  @override
  Future<List<Category>?> getAllCategories()async {
return await categoriesDataSource.getAllCategories();

  }

}