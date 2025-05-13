import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../auth/data/model/requests/login_req.dart';
import '../../auth/data/model/requests/sign_up_req.dart';
import '../../auth/data/model/response/login_resp.dart';
import '../../auth/data/model/response/sign_up_resp.dart';

import '../../home/home_tab/data/model/brand/BrandResponse.dart';
import '../../home/home_tab/data/model/category/CategoriesResponse.dart';
import '../../home/home_tab/domin/entites/category.dart';
import '../errors/error_handleing.dart';
import 'api_constant.dart';

@singleton
@injectable
class ApiManger {
  Future<Either<GeneralErrors, CategoriesResponse>?> getAllCategories() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.categoryEndPoint);
      var response = await http.get(url);

      var categoryResponse =
          CategoriesResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        return Right(categoryResponse);
      } else {
        return left(ServerErrors(message: categoryResponse.message ?? ""));
      }
    } else {
      return left(NetworkError(message: "please check the network"));
    }
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
