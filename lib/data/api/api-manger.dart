import 'dart:convert';

import 'package:e_comrece_app/data/api/api_constant.dart';
import 'package:e_comrece_app/data/model/requestes/auth/login_req.dart';
import 'package:e_comrece_app/data/model/requestes/auth/sign_up_req.dart';
import 'package:e_comrece_app/data/model/responses/auth/sign_up_resp.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../model/responses/auth/login_resp.dart';
import '../model/responses/brand/BrandResponse.dart';
import '../model/responses/category/CategoriesResponse.dart';

@singleton
@injectable
class ApiManger {
  Future<CategoriesResponse?> getAllCategories() async {
    try {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.categoryEndPoint);
      var response = await http.get(url);
      var json = jsonDecode(response.body);

      return CategoriesResponse.fromJson(json);
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<BrandResponse?> getAllBrand() async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.brandEndPoint);
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);

      return BrandResponse.fromJson(json);
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<SignUpResp?> register(String fullName, String email, String password,
      String rePassword, String phoneNumber) async {
    Uri uri = Uri.https(
      ApiConstant.baseUrl,
      ApiConstant.signUpEndPoint,
    );
    var request = SignUpReq(
        name: fullName,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phoneNumber);
    var response = await http.post(uri, body: request.toJson());
    return SignUpResp.fromJson(jsonDecode(response.body));
  }

  Future<LoginResp?> login(String email, String password) async {
    Uri uri = Uri.https(ApiConstant.baseUrl, ApiConstant.loginEndPoint);
    var request = LoginReq(email: email, password: password);
    var response = await http.post(uri, body: request.toJson());
    return LoginResp.fromJson(jsonDecode(response.body));
  }
}
