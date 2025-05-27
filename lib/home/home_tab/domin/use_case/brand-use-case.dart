

import 'package:dartz/dartz.dart';
import 'package:e_comrece_app/core/errors/error_handleing.dart';
import 'package:injectable/injectable.dart';

import '../entites/Brand.dart';
import '../repository_contract/brand-repository-contract.dart';
@injectable
class BrandUseCase{
  BrandRepositoryContract brandRepositoryContract;
  BrandUseCase({required this.brandRepositoryContract});
  Future<Either<GeneralErrors, List<Brand>>?> getAllBrands()async{
    return await brandRepositoryContract.getAllBrands();
  }
}