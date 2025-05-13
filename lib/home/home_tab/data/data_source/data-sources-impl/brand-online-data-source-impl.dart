
import 'package:injectable/injectable.dart';

import '../../../../../core/api/api-manger.dart';
import '../../../domin/entites/Brand.dart';
import '../data_source_contract/brand-online-data-source-contract.dart';


@Injectable(as: BrandOnlineDataSourceContract)
class BrandOnlineDataSourceImpl extends BrandOnlineDataSourceContract {
  ApiManger apiManger;
  BrandOnlineDataSourceImpl(this.apiManger);
  @override
  Future<List<Brand>?> getAllBrands() async {
    var brandResponse = await apiManger.getAllBrand();
    return brandResponse?.data?.map((brandDto) => brandDto.toBrand()).toList();
  }
}
