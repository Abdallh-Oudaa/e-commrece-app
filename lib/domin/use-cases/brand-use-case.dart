import 'package:e_comrece_app/domin/entities/Brand.dart';

import 'package:injectable/injectable.dart';

import '../repositories_contract/brand-repository-contract.dart';
@injectable
class BrandUseCase{
  BrandRepositoryContract brandRepositoryContract;
  BrandUseCase({required this.brandRepositoryContract});
  Future<List<Brand>?> getAllBrands()async{
    return await brandRepositoryContract.getAllBrands();
  }
}