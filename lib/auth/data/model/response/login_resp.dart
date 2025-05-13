import 'package:e_comrece_app/auth/data/model/response/sign_up_resp.dart';

class LoginResp {
  LoginResp({
      this.message, 
      this.user, 
      this.token,});

  LoginResp.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  User? user;
  String? token;



}



