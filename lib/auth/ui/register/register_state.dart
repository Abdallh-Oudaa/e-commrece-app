part of 'register_view_model.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {
  final String? message;
  RegisterLoading({required this.message});
}

final class RegisterSuccess extends RegisterState {
  final User? user;
  RegisterSuccess({required this.user});
}

final class RegisterError extends RegisterState {
  final String? message;
  RegisterError({required this.message});
}
