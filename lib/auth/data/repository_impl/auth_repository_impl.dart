
import 'package:injectable/injectable.dart';

import '../../domin/repository_contract/auth_repository_contract.dart';
import '../data_source/auth_data_source_contract.dart';
import '../model/response/login_resp.dart';
import '../model/response/sign_up_resp.dart';
@Injectable(as:AuthRepositoryContract )
class AuthRepositoryImpl extends AuthRepositoryContract{
  AuthDataSourceContract authDataSourceContract;
  AuthRepositoryImpl({required this.authDataSourceContract});
  @override
  Future<LoginResp?> login(String email, String password)async {
    return await authDataSourceContract.login(email, password);
  }

  @override
  Future<SignUpResp?> register(String name, String email, String password,
      String rePassword, String phoneNumber)async {
    return await authDataSourceContract.register(name, email, password, rePassword, phoneNumber);
  }



}