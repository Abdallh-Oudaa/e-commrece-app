import 'package:e_comrece_app/data/model/responses/auth/login_resp.dart';

abstract class LoginDataSourceContract{
  Future<LoginResp?> login(String email,String password);
}