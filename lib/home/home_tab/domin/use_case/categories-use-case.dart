

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/error_handleing.dart';
import '../entites/category.dart';
import '../repository_contract/categoires-contract.dart';
@injectable
class CategoriesUseCase{
  CategoriesContract categoriesContract;
  CategoriesUseCase({required this.categoriesContract});
 Future<Either<GeneralErrors,List<Category>>?> getAllCategories()async{
   var response= await categoriesContract.getAllCategories();
   return response?.fold((l) {
     return left(GeneralErrors(message: l.message));
   }, (r) {
     return right(r);
   },);
 }
}