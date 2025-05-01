import 'package:e_comrece_app/data/api/api-manger.dart';
import 'package:e_comrece_app/data/model/responses/auth/sign_up_resp.dart';
import 'package:injectable/injectable.dart';

import '../data-source-contract/register_data_source_contract.dart';

@Injectable(as: RegisterDataSourceContract)
class RegisterDataSourceImpl extends RegisterDataSourceContract {
  ApiManger apiManger;
  RegisterDataSourceImpl({required this.apiManger});
  @override
  Future<SignUpResp?> register(String name, String email, String password,
      String rePassword, String phoneNumber) async {
    return await apiManger.register(
        name, email, password, rePassword, phoneNumber);
  }
}
