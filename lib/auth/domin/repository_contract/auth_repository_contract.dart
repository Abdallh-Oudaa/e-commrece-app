import '../../data/model/response/login_resp.dart';
import '../../data/model/response/sign_up_resp.dart';

abstract class AuthRepositoryContract{
  Future<SignUpResp?> register(String name, String email, String password,
      String rePassword, String phoneNumber);
  Future<LoginResp?> login(String email,String password);
}