import 'package:e_comrece_app/auth/ui/login/Login_screen.dart';
import 'package:e_comrece_app/auth/ui/login/login_view_model_cubit.dart';
import 'package:e_comrece_app/core/Di/di.dart';
import 'package:e_comrece_app/core/shared_prefs/shared_prefs.dart';
import 'package:e_comrece_app/home/profile_tab/cubit/profile_view_model_cubit.dart';
import 'package:e_comrece_app/home/profile_tab/custom_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/my_colors/my_colors.dart';

class ProfileTab extends StatelessWidget {
  var viewModel = ProfileViewModelCubit();
  ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileViewModelCubit, ProfileViewModelState>(
      bloc: viewModel..getUser(),
      builder: (BuildContext context, state) {
        if (state is ProfileViewModelSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Welcome ${state.name}",
                          style:
                              TextStyle(color: Colors.black, fontSize: 25.sp),
                        ),
                        Text(
                          " ${state.email}",
                          style: TextStyle(
                              color: Colors.blueGrey, fontSize: 20.sp),
                        ),
                      ],
                    ),
                    InkWell(
                        onTap: () {
                          SharedPrefs.removeKey("token");
                          Navigator.pushReplacementNamed(
                              context, LoginScreen.routName);
                        },
                        child: Icon(
                          Icons.logout,
                          color: MyColors.primaryColor,
                        )),
                  ],
                ),
              ),
              CustomContainerWidget(
                  title: "Your full name", nameOrEmail: state.name ?? ""),
              CustomContainerWidget(
                  title: "Your E-mail", nameOrEmail: state.email ?? ""),
            ],
          );
        } else if (state is ProfileViewModeError) {
          return Center(
            child: Text(
              state.message ?? "",
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
/*  */
