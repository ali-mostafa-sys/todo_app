import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:to_do_app/features/auth/login_export.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => sl<LoginBloc>(),
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is AllLoginState) {
                if (state.login == Login.loading) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const LoadingWithOpacityWidget();
                      });
                }
                if (state.login == Login.error) {
                  AutoRouter.of(context).pop();
                  AppSnackBarMessage().showSnackBar(
                      message: state.error!,
                      backgroundColor: AppColor().redColor,
                      context: context);
                }
                if (state.login == Login.loaded) {
                  AutoRouter.of(context).pushAndPopUntil(const HomeScreen(),
                      predicate: (route) => false);
                }
              }
            },
            builder: (context, state) {
              var loginBloc = LoginBloc.get(context);

              return SingleChildScrollView(
                child: Container(
                  width: w,
                  height: h,
                  color: AppColor().backgroundColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 84.4.h,
                        ),
                        AppText(
                            text: 'Login!',
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColor().textColor),
                        SizedBox(
                          height: 25.h,
                        ),
                        Form(
                            key: loginBloc.loginFormKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// here use name

                                AppTextFormWidget(
                                    text: 'User Name*',
                                    controller: loginBloc.userName,
                                    textInputType: TextInputType.text,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "The field must be filled out";
                                      }
                                    }),

                                SizedBox(
                                  height: 33.h,
                                ),

                                /// here Password*
                                AppTextFormWidget(
                                    text: 'Password*',
                                    controller: loginBloc.password,
                                    textInputType: TextInputType.text,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "The field must be filled out";
                                      }
                                    }),
                                SizedBox(
                                  height: 44.h,
                                ),

                                AppButton(
                                  width: 400.w,
                                  height: 50.h,
                                  onTap: () {
                                    if (loginBloc.loginFormKey.currentState!
                                        .validate()) {
                                      final loginPostEntity = LoginPostEntity(
                                          userName: loginBloc.userName.text,
                                          password: loginBloc.password.text);
                                      loginBloc.add(PostLoginEvent(
                                          loginPostEntity: loginPostEntity));
                                    }
                                  },
                                  text: 'Login',
                                  color: AppColor().buttonColor,
                                  fontSize: 18.sp,
                                  textColor: AppColor().textColor,
                                  fontWeight: FontWeight.bold,
                                  borderColor: AppColor().buttonColor,
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
