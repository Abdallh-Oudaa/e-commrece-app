
import 'package:injectable/injectable.dart';

import '../../../core/api/api-manger.dart';
import '../model/response/login_resp.dart';
import '../model/response/sign_up_resp.dart';
import 'auth_data_source_contract.dart';
@Injectable(as: AuthDataSourceContract)
class AuthDataSourceImpl extends AuthDataSourceContract{
  ApiManger apiManger;
  AuthDataSourceImpl({required this.apiManger});
  @override

  Future<LoginResp?> login(String email, String password)async {

    return await apiManger.login(email, password);
  }

  @override
  Future<SignUpResp?> register(String name, String email, String password,
      String rePassword, String phoneNumber) async {
    return await apiManger.register(
        name, email, password, rePassword, phoneNumber);
  }
}