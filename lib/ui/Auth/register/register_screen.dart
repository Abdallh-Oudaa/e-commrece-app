import 'package:e_comrece_app/core/Di/di.dart';
import 'package:e_comrece_app/core/my_colors/my_colors.dart';
import 'package:e_comrece_app/ui/Auth/login/Login_screen.dart';

import 'package:e_comrece_app/ui/Auth/widgets/text_field_itme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/dailog_utils.dart';
import '../widgets/email_regex.dart';
import 'register_view_model.dart';

class RegisterScreen extends StatefulWidget {
  static const String routName = "RegisterScreen";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var viewModel = getIt.get<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, RegisterState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterSuccess) {
          DialogUtils.hideDialog(context: context);
          DialogUtils.showMessage(
              context: context, message: "register successfully  ${state.user?.name}",
            posAction: "ok",
            posCallBack: () =>
                Navigator.pushReplacementNamed(context,LoginScreen.routName),);
        } else if (state is RegisterError) {
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
      child: Scaffold(
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
                TextFieldItem(
                  hintText: "Enter your name",
                  validation: (text) {
                    if (text!.trim().isEmpty) {
                      return "field is empty";
                    }

                    return null;
                  },
                  keyboardType: TextInputType.text,
                  controller: viewModel.userName,
                  addressText: 'Full Name',
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
                      child: Icon(viewModel.isVisible
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  hintText: "Enter your password",
                  validation: (text) {
                    if (text!.trim().isEmpty) {
                      return "field is empty";
                    }
                    if (text.length < 6) {
                      return "password too short";
                    }

                    return null;
                  },
                  keyboardType: TextInputType.text,
                  controller: viewModel.password,
                  addressText: 'password',
                  obsText: viewModel.isVisible ? false : true,
                ),
                TextFieldItem(
                  suffixIcon: InkWell(
                      onTap: () {
                        viewModel.isVisible = !viewModel.isVisible;
                        setState(() {});
                      },
                      child: Icon(viewModel.isVisible
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  hintText: "Enter your confirm Password",
                  validation: (text) {
                    if (text!.trim().isEmpty) {
                      return "field is empty";
                    }
                    if (text.length < 6) {
                      return "password too short";
                    }
                    if (viewModel.password.text !=
                        viewModel.confirmPassword.text) {
                      return "no match password";
                    }

                    return null;
                  },
                  keyboardType: TextInputType.text,
                  controller: viewModel.confirmPassword,
                  addressText: 'confirm password',
                  obsText: viewModel.isVisible ? false : true,
                ),
                TextFieldItem(
                  hintText: "Enter your mobile number",
                  validation: (text) {
                    if (text!.trim().isEmpty) {
                      return "field is empty";
                    }
                    if (text.length < 11) {
                      return "less than 11 number";
                    }
                    if (text.length > 11) {
                      return "more than 11 number";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  controller: viewModel.mobileNumber,
                  addressText: 'Mobile Number',
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        if (viewModel.formKey.currentState!.validate() ==
                            true) {
                          viewModel.register();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          "sign up",
                          style: TextStyle(
                              color: MyColors.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
