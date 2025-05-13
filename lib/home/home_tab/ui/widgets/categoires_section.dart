import 'package:e_comrece_app/core/Di/di.dart';
import 'package:e_comrece_app/core/my_colors/my_colors.dart';
import 'package:e_comrece_app/home/home_tab/ui/cubit/home_tab_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_category_item.dart';

class CategoriesSection extends StatelessWidget {
  var viewModel = getIt.get<HomeTabViewModelCubit>();
  CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModelCubit, HomeTabViewModelState>(
        bloc: viewModel..getAllCategories(),
        builder: (context, state) {
          if (state is SuccessState) {
            return SizedBox(
              height: 250,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2,),
                itemBuilder: (context, index) =>  CustomCategoryItem( category: state.allCategories[index],),
                itemCount: state.allCategories.length,
                scrollDirection: Axis.horizontal,
              ),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Text(
                state.message,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: MyColors.primaryColor),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
