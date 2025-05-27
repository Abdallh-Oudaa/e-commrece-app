import 'package:bloc/bloc.dart';
import 'package:e_comrece_app/home/home_tab/domin/entites/Brand.dart';
import 'package:e_comrece_app/home/home_tab/domin/entites/category.dart';
import 'package:e_comrece_app/home/home_tab/domin/use_case/brand-use-case.dart';
import 'package:e_comrece_app/home/home_tab/domin/use_case/categories-use-case.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'home_tab_state.dart';

@Injectable()
class HomeTabViewModelCubit extends Cubit<HomeTabViewModelState> {
  CategoriesUseCase categoriesUseCase;
  BrandUseCase brandUseCase;

  TextEditingController search = TextEditingController();
  List<String> imagesPath = [
    "lib/core/my_assets/images/imageSlide.png",
    "lib/core/my_assets/images/announcment2.png",
    "lib/core/my_assets/images/announcment3.png"
  ];
  List<Brand> brands=[];
  HomeTabViewModelCubit(this.categoriesUseCase, this.brandUseCase)
      : super(HomeTabViewModelInitial());
  void getAllCategories() async {
    emit(LoadingState());
    var response = await categoriesUseCase.getAllCategories();
    return response?.fold(
      (l) {
        emit(ErrorState(message: l.message));
      },
      (r) {
        emit(SuccessState(allCategories: r));
      },
    );
  }

  void getAllBrands() async {
    emit(LoadingState());
    var response = await brandUseCase.getAllBrands();
    return response?.fold(
      (l) {
        emit(ErrorState(message: l.message));
      },
      (r) {
        brands=r;
        emit(SuccessBrandsState(allBrands: r));
      },
    );
  }
}
