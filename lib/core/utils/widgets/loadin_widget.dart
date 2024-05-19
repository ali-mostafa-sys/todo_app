import 'package:flutter/material.dart';

import 'package:to_do_app/core/utils/theme/app_theme.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor().backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Center(
          child: SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              color: AppColor().buttonColor,
            ),
          ),
        ),
      ),
    );
  }
}

class LoadingWithOpacityWidget extends StatelessWidget {
  const LoadingWithOpacityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor().backgroundColor.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Center(
          child: SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              color: AppColor().buttonColor,
            ),
          ),
        ),
      ),
    );
  }
}
