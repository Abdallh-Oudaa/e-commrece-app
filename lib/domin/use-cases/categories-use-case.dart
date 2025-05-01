import 'package:e_comrece_app/domin/entities/category.dart';

import 'package:injectable/injectable.dart';

import '../repositories_contract/categoires-contract.dart';
@injectable
class CategoriesUseCase{
  CategoriesContract categoriesContract;
  CategoriesUseCase({required this.categoriesContract});
 Future<List<Category>?> getAllCategories()async{
   return await categoriesContract.getAllCategories();
 }
}