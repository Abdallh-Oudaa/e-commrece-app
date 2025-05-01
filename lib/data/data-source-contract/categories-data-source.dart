

import 'package:e_comrece_app/domin/entities/category.dart';




abstract class CategoriesDataSource{
 Future<List<Category>?> getAllCategories();
}