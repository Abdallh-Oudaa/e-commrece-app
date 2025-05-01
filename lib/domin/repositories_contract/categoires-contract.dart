import 'package:e_comrece_app/domin/entities/category.dart';

abstract class CategoriesContract{
 Future<List<Category>?> getAllCategories();
}