

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/error_handleing.dart';
import '../../domin/entites/Brand.dart';
import '../../domin/repository_contract/brand-repository-contract.dart';

import '../data_source/data_source_contract/brand-online-data-source-contract.dart';

@Injectable(as:BrandRepositoryContract )
class BrandRepositoryImpl extends BrandRepositoryContract{
  BrandOnlineDataSourceContract brandOnlineDataSourceContract;
  BrandRepositoryImpl(this.brandOnlineDataSourceContract);
  @override
  Future<Either<GeneralErrors, List<Brand>>?> getAllBrands()async {
   var response= await brandOnlineDataSourceContract.getAllBrands();
   return response!.fold((l) {
     return left(GeneralErrors(message: l.message));
   }, (r) {
     return right(r);
   },);

  }

}