import 'package:bloc/bloc.dart';
import 'package:e_comrece_app/auth/data/model/response/login_resp.dart';
import 'package:e_comrece_app/core/shared_prefs/shared_prefs.dart';

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domin/repository_contract/auth_repository_contract.dart';


part 'login_view_model_state.dart';
@injectable
class LoginViewModelCubit extends Cubit<LoginViewModelState> {
  AuthRepositoryContract authRepositoryContract;
  final TextEditingController emailAddress = TextEditingController();

  final TextEditingController password = TextEditingController();

  bool isVisible = false;
  var formKey = GlobalKey<FormState>();
  @factory LoginViewModelCubit({required this.authRepositoryContract})
      : super(LoginViewModelInitial());
  void login() async {

      emit(LoginViewModelLoading(message: "loading"));
      try {
        var response =
            await authRepositoryContract.login(emailAddress.text, password.text);
        if (response?.message != "success") {
          emit(LoginViewModelError(message: response?.message ?? ""));
        } else {


          emit(LoginViewModelSuccess(loginResp: response));
        }
      } catch (e) {

        emit(LoginViewModelError(message: e.toString()));
      }
    }
  }

