import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api/api-manger.dart';
import '../../../../../core/errors/error_handleing.dart';
import '../../../domin/entites/Brand.dart';
import '../data_source_contract/brand-online-data-source-contract.dart';

@Injectable(as: BrandOnlineDataSourceContract)
class BrandOnlineDataSourceImpl extends BrandOnlineDataSourceContract {
  ApiManger apiManger;
  BrandOnlineDataSourceImpl(this.apiManger);
  @override
  Future<Either<GeneralErrors, List<Brand>>?> getAllBrands() async {
    var response = await apiManger.getAllBrands();
    return response?.fold(
      (error) {
        return left(GeneralErrors(message: error.message));
      },
      (response) {
        return Right(response.data!.map(
          (e) {
            return e.toBrand();
          },
        ).toList());
      },
    );
  }
}
