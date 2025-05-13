

import 'package:injectable/injectable.dart';

import '../entites/Brand.dart';
import '../repository_contract/brand-repository-contract.dart';
@injectable
class BrandUseCase{
  BrandRepositoryContract brandRepositoryContract;
  BrandUseCase({required this.brandRepositoryContract});
  Future<List<Brand>?> getAllBrands()async{
    return await brandRepositoryContract.getAllBrands();
  }
}