import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/theme/app_theme.dart';

class ErrorPageWidget extends StatelessWidget {
  ErrorPageWidget({Key? key, required this.errorText, required this.onTap})
      : super(key: key);
  String errorText;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColor().backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorText,
            style: TextStyle(
              color: AppColor().textColor,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColor().buttonColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                'Refresh',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColor().textColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
