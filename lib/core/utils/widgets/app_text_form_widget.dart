import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/utils/widgets/app_text.dart';

import '../theme/app_theme.dart';

class AppTextFormWidget extends StatelessWidget {
  AppTextFormWidget({
    Key? key,
    this.text,
    required this.controller,
    required this.textInputType,
    this.validator,
    this.onChanged,
    this.onTap,
    this.hintText,
    this.suffixIcon,
    this.onEditingComplete,
  }) : super(key: key);

  String? text;
  TextEditingController controller;
  TextInputType textInputType;

  String? hintText;
  String? Function(String?)? validator;
  void Function(String)? onChanged;
  void Function()? onEditingComplete;
  void Function()? onTap;
  Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text == null
            ? Container()
            : AppText(
                text: text ?? '',
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: AppColor().textColor),
        text == null
            ? Container()
            : SizedBox(
                height: 12.h,
              ),
        TextFormField(
          style: TextStyle(color: AppColor().textColor),
          controller: controller,
          keyboardType: textInputType,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            border: InputBorder.none,
            hintText: hintText ?? ('Please Enter'),
          ),
          validator: validator,
          onChanged: onChanged,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
        ),
      ],
    );
  }
}
