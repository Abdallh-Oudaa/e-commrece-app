part of 'home_tab_view_model_cubit.dart';

@immutable
sealed class HomeTabViewModelState {}

final class HomeTabViewModelInitial extends HomeTabViewModelState {}
 class SuccessState extends HomeTabViewModelState{
 final List<Category> allCategories;
  SuccessState({required this.allCategories});
}
class ErrorState extends HomeTabViewModelState{
 final String message;
  ErrorState({required this.message});
}
class LoadingState extends HomeTabViewModelState{

}

