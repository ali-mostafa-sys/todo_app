import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/storage/app_storage.dart';
import 'package:to_do_app/core/utils/theme/app_theme.dart';
import 'package:to_do_app/export_main_app.dart';

import '../../../../core/router/routers.gr.dart';

@RoutePage()
class LauncherScreen extends StatefulWidget {
  const LauncherScreen({Key? key}) : super(key: key);

  @override
  State<LauncherScreen> createState() => _LauncherScreenState();
}

class _LauncherScreenState extends State<LauncherScreen> {
  @override
  void initState() {
    final token = AppStorage().getToken();

    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (token != null) {
        AutoRouter.of(context)
            .pushAndPopUntil(const HomeScreen(), predicate: (route) => false);
      } else {
        AutoRouter.of(context)
            .pushAndPopUntil(const LoginScreen(), predicate: (route) => false);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor().backgroundColor,
        child: Center(
          child: Text(
            ' TODO APP',
            style: TextStyle(color: AppColor().textColor, fontSize: 50.sp),
          ),
        ),
      ),
    );
  }
}
