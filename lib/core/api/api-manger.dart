import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_comrece_app/core/shared_prefs/shared_prefs.dart';
import 'package:e_comrece_app/home/product_tab/data/model/add_to_cart_dto.dart';
import 'package:e_comrece_app/home/product_tab/data/model/get_cart_items_dto.dart';
import 'package:e_comrece_app/home/product_tab/data/model/product_id_req.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../auth/data/model/requests/login_req.dart';
import '../../auth/data/model/requests/sign_up_req.dart';
import '../../auth/data/model/response/login_resp.dart';
import '../../auth/data/model/response/sign_up_resp.dart';

import '../../home/home_tab/data/model/brand/BrandResponse.dart';
import '../../home/home_tab/data/model/category/CategoriesResponse.dart';

import '../../home/product_tab/data/model/Product_respnse_dto.dart';

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

  Future<Either<GeneralErrors, BrandResponse>?> getAllBrands() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.brandEndPoint);
      var response = await http.get(url);

      var brandResponse = BrandResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        return Right(brandResponse);
      } else {
        return left(ServerErrors(message: brandResponse.message ?? ""));
      }
    } else {
      return left(NetworkError(message: "please check the network"));
    }
  }

  Future<Either<GeneralErrors, ProductResponseDto>?> getAllProducts() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.productEndPoint);
      var response = await http.get(url);

      var productsResponse =
          ProductResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        return Right(productsResponse);
      } else {
        return left(ServerErrors(message: productsResponse.message ?? ""));
      }
    } else {
      return left(NetworkError(message: "please check the network"));
    }
  }

  Future<Either<GeneralErrors, AddToCartDto>?> addToCart(
      String productId) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var token = await SharedPrefs.getData("token") ?? "";
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.addToCartEndPoint);
      var productIdReq = ProductIdReq(productId);
      var response = await http
          .post(url, body: productIdReq.toJson(), headers: {"token": token});

      var addToCartResponse = AddToCartDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        return Right(addToCartResponse);
      } else {
        return left(ServerErrors(message: addToCartResponse.message ?? ""));
      }
    } else {
      return left(NetworkError(message: "please check the network"));
    }
  }

  Future<Either<GeneralErrors, GetCartItemsDto>?> getCartItems() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var token = await SharedPrefs.getData("token") ?? "";

      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.addToCartEndPoint);
      var response = await http.get(
        url,headers: {"token":token}
      );

      var getCartItems = GetCartItemsDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        SharedPrefs.setData("badge", getCartItems.numOfCartItems.toString());
        return Right(getCartItems);
      } else {
        return left(ServerErrors(message: getCartItems.status ?? ""));
      }
    } else {
      return left(NetworkError(message: "please check the network"));
    }
  }
  Future<Either<GeneralErrors, GetCartItemsDto>?> deleteCart(String productId) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var token = await SharedPrefs.getData("token") ?? "";

      Uri url = Uri.https(ApiConstant.baseUrl, "${ApiConstant.addToCartEndPoint}/$productId");
      var response = await http.delete(
          url,headers: {"token":token}
      );

      var deleteCartItem = GetCartItemsDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        return Right(deleteCartItem);
      } else {
        return left(ServerErrors(message: deleteCartItem.status ?? ""));
      }
    } else {
      return left(NetworkError(message: "please check the network"));
    }
  }
  Future<Either<GeneralErrors, GetCartItemsDto>?> updateCart(String productId,int count) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var token = await SharedPrefs.getData("token") ?? "";

      Uri url = Uri.https(ApiConstant.baseUrl, "${ApiConstant.addToCartEndPoint}/$productId");
      var response = await http.put(
          url,headers: {"token":token},body: {
            "count":"$count"
      }
      );

      var updateCart = GetCartItemsDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        return Right(updateCart);
      } else {
        return left(ServerErrors(message: updateCart.status ?? ""));
      }
    } else {
      return left(NetworkError(message: "please check the network"));
    }
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
    LoginResp loginResp = LoginResp.fromJson(jsonDecode(response.body));
    SharedPrefs.setData(
        "token", loginResp.token);
    SharedPrefs.setData(
        "name", loginResp.user?.name);
    SharedPrefs.setData(
        "email", loginResp.user?.email);//to save token in shared prefs
    return loginResp;
  }
}
