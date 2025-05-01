import 'package:e_comrece_app/core/Di/di.dart';
import 'package:e_comrece_app/ui/Auth/login/login_view_model_cubit.dart';
import 'package:e_comrece_app/ui/Auth/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../core/my_colors/my_colors.dart';
import '../widgets/dailog_utils.dart';
import '../widgets/email_regex.dart';
import '../widgets/text_field_itme.dart';

class LoginScreen extends StatefulWidget {
  static const String routName = "login screen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
var viewModel=getIt.get<LoginViewModelCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModelCubit,LoginViewModelState>(
      bloc: viewModel,
      listener:(context, state) {

        if (state is LoginViewModelSuccess) {
          DialogUtils.hideDialog(context: context);
          DialogUtils.showMessage(
            context: context, message: "success login",
            posAction: "ok",
            posCallBack: () =>
                Navigator.pushReplacementNamed(context,RegisterScreen.routName),);
        } else if (state is LoginViewModelError) {
          DialogUtils.hideDialog(context: context);
          DialogUtils.showMessage(
            context: context,
            message: state.message ?? "",
            posAction: "ok",
            posCallBack: () =>
            DialogUtils.hideDialog(context: context),

          );
        } else {
          DialogUtils.showLoading(context: context, message: "Loading");
        }
    },
    child:Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: SingleChildScrollView(
        child: Form(
          key: viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    top: 50.h,
                    left: 97.w,
                    right: 97.w,
                  ),
                  child: Image.asset(
                    "lib/core/my_assets/images/Route.png",
                    width: 237.w,
                    height: 71.h,
                  )),
              Padding(
                padding: EdgeInsets.only(top: 40.h, bottom: 4.h, left: 8.w),
                child: Text(
                  "welcome back to Route",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w500, fontSize: 25),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Text(
                  "sign in with your email",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.start,
                ),
              ),
              TextFieldItem(
                hintText: "Enter your E-mail address",
                validation: (text) {
                  if (text!.trim().isEmpty) {
                    return "field is empty";
                  }
                  if (validateEmail(text) != null) {
                    return "syntax error";
                  }

                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                controller: viewModel.emailAddress,
                addressText: 'E-mail address',
              ),
              TextFieldItem(
                suffixIcon: InkWell(
                    onTap: () {
                      viewModel.isVisible = !viewModel.isVisible;
                      setState(() {});
                    },
                    child: Icon(
                        viewModel.isVisible ? Icons.visibility : Icons.visibility_off)),
                hintText: "Enter your password",
                validation: (text) {
                  if (text!.trim().isEmpty) {
                    return "field is empty";
                  }

                  return null;
                },
                keyboardType: TextInputType.text,
                controller: viewModel.password,
                addressText: 'password',
                obsText: viewModel.isVisible ? false : true,
              ),
              Padding(
                padding: EdgeInsets.only(right: 5.sp),
                child: Text(
                  "forget password",
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.end,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
                decoration: const BoxDecoration(),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      viewModel.login();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: MyColors.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
              ),
              Text(
                "Don't have an account? create account",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ) ,);
  }
}
