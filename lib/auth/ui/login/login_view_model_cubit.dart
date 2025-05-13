import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domin/repository_contract/auth_repository_contract.dart';


part 'login_view_model_state.dart';

@Injectable()
class LoginViewModelCubit extends Cubit<LoginViewModelState> {
  AuthRepositoryContract authRepositoryContract;
  final TextEditingController emailAddress = TextEditingController();

  final TextEditingController password = TextEditingController();

  bool isVisible = false;
  var formKey = GlobalKey<FormState>();
  LoginViewModelCubit({required this.authRepositoryContract})
      : super(LoginViewModelInitial());
  void login() async {
    if (formKey.currentState!.validate() == true) {
      emit(LoginViewModelLoading(message: "loading"));
      try {
        var response =
            await authRepositoryContract.login(emailAddress.text, password.text);
        if (response?.message != "success") {
          emit(LoginViewModelError(message: response?.message ?? ""));
        } else {
          emit(LoginViewModelSuccess(message: response?.message ?? ""));
        }
      } catch (e) {
        emit(LoginViewModelError(message: e.toString()));
      }
    }
  }
}
