import 'package:e_comrece_app/data/api/api-manger.dart';
import 'package:e_comrece_app/data/data-source-contract/Login_data_source_contract.dart';
import 'package:e_comrece_app/data/model/responses/auth/login_resp.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:LoginDataSourceContract )
class LoginDataSourceImpl extends LoginDataSourceContract{
  ApiManger apiManger;
  LoginDataSourceImpl({required this.apiManger});
  @override
  Future<LoginResp?> login(String email, String password)async {

    return await apiManger.login(email, password);
  }

}