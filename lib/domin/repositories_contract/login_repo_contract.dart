import '../../data/model/responses/auth/login_resp.dart';

abstract class LoginRepsContract{
  Future<LoginResp?> login(String email,String password);
}