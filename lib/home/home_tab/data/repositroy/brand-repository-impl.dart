

import 'package:injectable/injectable.dart';

import '../../domin/entites/Brand.dart';
import '../../domin/repository_contract/brand-repository-contract.dart';

import '../data_source/data_source_contract/brand-online-data-source-contract.dart';

@Injectable(as:BrandRepositoryContract )
class BrandRepositoryImpl extends BrandRepositoryContract{
  BrandOnlineDataSourceContract brandOnlineDataSourceContract;
  BrandRepositoryImpl(this.brandOnlineDataSourceContract);
  @override
  Future<List<Brand>?> getAllBrands()async {
   return await brandOnlineDataSourceContract.getAllBrands();

  }

}