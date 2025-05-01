import 'package:e_comrece_app/data/data-source-contract/brand-online-data-source-contract.dart';

import 'package:e_comrece_app/domin/entities/Brand.dart';

import 'package:injectable/injectable.dart';

import '../../domin/repositories_contract/brand-repository-contract.dart';
@Injectable(as:BrandRepositoryContract )
class BrandRepositoryImpl extends BrandRepositoryContract{
  BrandOnlineDataSourceContract brandOnlineDataSourceContract;
  BrandRepositoryImpl(this.brandOnlineDataSourceContract);
  @override
  Future<List<Brand>?> getAllBrands()async {
   return await brandOnlineDataSourceContract.getAllBrands();

  }

}