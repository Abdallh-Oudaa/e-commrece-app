import 'package:e_comrece_app/data/model/responses/auth/sign_up_resp.dart';

abstract class RegisterDataSourceContract{
 Future<SignUpResp?> register(String name, String email, String password,
     String rePassword, String phoneNumber);
}