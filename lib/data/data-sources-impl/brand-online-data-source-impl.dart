import 'package:e_comrece_app/data/api/api-manger.dart';
import 'package:e_comrece_app/data/data-source-contract/brand-online-data-source-contract.dart';
import 'package:e_comrece_app/domin/entities/Brand.dart';
import 'package:injectable/injectable.dart';
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
