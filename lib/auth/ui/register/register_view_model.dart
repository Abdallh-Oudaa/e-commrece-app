import 'package:bloc/bloc.dart';


import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../data/model/response/login_resp.dart';
import '../../data/model/response/sign_up_resp.dart';
import '../../domin/repository_contract/auth_repository_contract.dart';



part 'register_state.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterState> {
  AuthRepositoryContract authRepositoryContract;
  final TextEditingController userName = TextEditingController();

  final TextEditingController mobileNumber = TextEditingController();

  final TextEditingController emailAddress = TextEditingController();

  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  bool isVisible = false;
  var formKey = GlobalKey<FormState>();
  RegisterViewModel(this.authRepositoryContract) : super(RegisterInitial());
  register() async {
    emit(RegisterLoading(message: "Loading"));
    try {
      var response = await authRepositoryContract.register(
          userName.text,
          emailAddress.text,
          password.text,
          confirmPassword.text,
          mobileNumber.text);
      if (response?.message != "success") {
        emit(RegisterError(message: response?.message));
      } else {
        emit(RegisterSuccess(user: response!.user));
      }
    } catch (e) {
      emit(RegisterError(message: e.toString()));
    }
  }
}
