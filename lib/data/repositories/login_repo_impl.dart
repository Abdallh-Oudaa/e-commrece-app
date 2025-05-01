import 'package:e_comrece_app/data/data-source-contract/Login_data_source_contract.dart';
import 'package:e_comrece_app/data/model/responses/auth/login_resp.dart';
import 'package:injectable/injectable.dart';

import '../../domin/repositories_contract/login_repo_contract.dart';
@Injectable(as:LoginRepsContract )
class LoginRepoImpl extends LoginRepsContract{
   LoginDataSourceContract loginDataSourceContract;
  LoginRepoImpl({required this.loginDataSourceContract});
  @override
  Future<LoginResp?> login(String email, String password)async {
    return await loginDataSourceContract.login(email, password);
  }

}