import 'package:bloc/bloc.dart';
import 'package:e_comrece_app/home/favourite_tab/favourite_tab.dart';
import 'package:e_comrece_app/home/home_tab/ui/home_tab.dart';
import 'package:e_comrece_app/home/product_tab/product_tab.dart';
import 'package:e_comrece_app/home/profile_tab/profile_tab.dart';
import 'package:flutter/cupertino.dart';




class HomeScreenViewModelCubit extends Cubit<HomeScreenViewModelState> {
  List<Widget> tabs=[ HomeTab(),const ProductTab(),const FavouriteTab(),const ProfileTab()];
  int currentIndex=0;
  HomeScreenViewModelCubit() : super(HomeScreenViewModelInitial());
  changeTabs(int index){

    currentIndex=index;
    emit(ChangeTab());
  }
}
sealed class HomeScreenViewModelState {}
class HomeScreenViewModelInitial extends HomeScreenViewModelState{}
class ChangeTab extends HomeScreenViewModelState{}

