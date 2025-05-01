import 'package:bloc/bloc.dart';
import 'package:e_comrece_app/data/model/responses/auth/sign_up_resp.dart';

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domin/repositories_contract/register_repo_contrcat.dart';

part 'register_state.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterState> {
  RegisterRepoContract registerRepoContract;
  final TextEditingController userName = TextEditingController();

  final TextEditingController mobileNumber = TextEditingController();

  final TextEditingController emailAddress = TextEditingController();

  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  bool isVisible = false;
  var formKey = GlobalKey<FormState>();
  RegisterViewModel(this.registerRepoContract) : super(RegisterInitial());
  register() async {
    emit(RegisterLoading(message: "Loading"));
    try {
      var response = await registerRepoContract.register(
          userName.text,
          emailAddress.text,
          password.text,
          confirmPassword.text,
          mobileNumber.text);
      if (response?.message != "success") {
        emit(RegisterError(message: response?.message));
      } else {
        emit(RegisterSuccess(user: response?.user));
      }
    } catch (e) {
      emit(RegisterError(message: e.toString()));
    }
  }
}
