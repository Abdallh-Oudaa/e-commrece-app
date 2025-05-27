part of 'profile_view_model_cubit.dart';

@immutable
sealed class ProfileViewModelState {}

final class ProfileViewModelInitial extends ProfileViewModelState {}
final class ProfileViewModelSuccess extends ProfileViewModelState {
 final String? name;
 final String? email;
  ProfileViewModelSuccess({required this.name,required this.email});
}
final class ProfileViewModeLoading extends ProfileViewModelState {}
final class ProfileViewModeError extends ProfileViewModelState {
 final String? message;
 ProfileViewModeError({required this.message});
}


