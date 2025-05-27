part of 'login_view_model_cubit.dart';

@immutable
sealed class LoginViewModelState {}

final class LoginViewModelInitial extends LoginViewModelState {}
final class LoginViewModelSuccess extends LoginViewModelState {

  LoginResp? loginResp;
  LoginViewModelSuccess({required this.loginResp});
}
final class LoginViewModelLoading extends LoginViewModelState {
  String message;
  LoginViewModelLoading({required this.message});
}
final class LoginViewModelError extends LoginViewModelState {
  String message;
  LoginViewModelError({required this.message});
}

