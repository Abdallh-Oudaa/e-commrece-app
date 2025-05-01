import 'package:e_comrece_app/data/data-source-contract/register_data_source_contract.dart';
import 'package:e_comrece_app/data/model/responses/auth/sign_up_resp.dart';

import 'package:injectable/injectable.dart';

import '../../domin/repositories_contract/register_repo_contrcat.dart';
@Injectable(as:RegisterRepoContract)
class RegisterRepoImpl extends RegisterRepoContract{
  RegisterDataSourceContract registerDataSourceContract;
  RegisterRepoImpl({required this.registerDataSourceContract});
  @override
  Future<SignUpResp?> register(String name, String email, String password,
      String rePassword, String phoneNumber)async {
   return await registerDataSourceContract.register(name, email, password, rePassword, phoneNumber);
  }

}