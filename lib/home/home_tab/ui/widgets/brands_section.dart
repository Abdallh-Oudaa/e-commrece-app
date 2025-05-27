import 'package:e_comrece_app/core/Di/di.dart';
import 'package:e_comrece_app/home/home_tab/ui/widgets/custom_brand_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/my_colors/my_colors.dart';
import '../cubit/home_tab_view_model_cubit.dart';

class BrandsSection extends StatelessWidget {
  var viewModel = getIt.get<HomeTabViewModelCubit>();
  BrandsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModelCubit, HomeTabViewModelState>(
        bloc: viewModel..getAllBrands(),
        builder: (context, state) {
          if (state is SuccessBrandsState) {

            return SizedBox(
              height: 250,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) => CustomBrandItem(
                  brand: state.allBrands[index],

                ),
                itemCount: state.allBrands.length,
                scrollDirection: Axis.horizontal,
              ),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Text(
                state.message,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: MyColors.primaryColor),
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
