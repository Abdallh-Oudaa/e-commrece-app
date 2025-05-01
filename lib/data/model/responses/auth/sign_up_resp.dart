import 'package:e_comrece_app/data/model/responses/auth/num_error_resp.dart';

class SignUpResp {
  SignUpResp({
    this.message,
    this.user,
    this.token,this.error});

  SignUpResp.fromJson(dynamic json) {
    message = json['message'];
    error = json['errors'];

    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? message;
  User? user;
  String? token;

  ErrorPhone? error;
}

class User {
  User({
      this.name, 
      this.email, 
      this.role,});

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? name;
  String? email;
  String? role;



}